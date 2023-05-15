function OpenBossMenu(society, close, options)
	options = options or {}
	local elements = {
		{unselectable = true, icon = "fas fa-user", title = TranslateCap('boss_menu')}
	}

	ESX.TriggerServerCallback('esx_society:isBoss', function(isBoss)
		if isBoss then
			local defaultOptions = {
				checkBal = true,
				withdraw = true,
				deposit = true,
				wash = true,
				employees = true,
				salary = true,
				grades = true
			}

			for k,v in pairs(defaultOptions) do
				if options[k] == nil then
					options[k] = v
				end
			end

			if options.checkBal then
				elements[#elements+1] = {icon = "fas fa-wallet", title = TranslateCap('check_society_balance'), value = "check_society_balance"}
			end
			if options.withdraw then
				elements[#elements+1] = {icon = "fas fa-wallet", title = TranslateCap('withdraw_society_money'), value = "withdraw_society_money"}
			end
			if options.deposit then
				elements[#elements+1] = {icon = "fas fa-wallet", title = TranslateCap('deposit_society_money'), value = "deposit_money"}
			end
			if options.wash then
				elements[#elements+1] = {icon = "fas fa-wallet", title = TranslateCap('wash_money'), value = "wash_money"}
			end
			if options.employees then
				elements[#elements+1] = {icon = "fas fa-users", title = TranslateCap('employee_management'), value = "manage_employees"}
			end
			if options.salary then
				elements[#elements+1] = {icon = "fas fa-wallet", title = TranslateCap('salary_management'), value = "manage_salary"}
			end
			if options.grades then
				elements[#elements+1] = {icon = "fas fa-scroll", title = TranslateCap('grade_management'), value = "manage_grades"}
			end

			ESX.OpenContext("right", elements, function(menu,element)
				if element.value == "check_society_balance" then
					TriggerServerEvent('esx_society:checkSocietyBalance', society)
				elseif element.value == "withdraw_society_money" then
					local elements = {
						{unselectable = true, icon = "fas fa-wallet", title = TranslateCap('withdraw_amount'), description = "Withdraw money from the society account"},
						{icon = "fas fa-wallet", title = "Amount", input = true, inputType = "number", inputPlaceholder = "Amount to withdraw..", inputMin = 1, inputMax = 250000, name = "withdraw"},
						{icon = "fas fa-check", title = "Confirm", value = "confirm"},
						{icon = "fas fa-arrow-left", title = "Return", value = "return"}
					}
					ESX.RefreshContext(elements)
				elseif element.value == "confirm" then
					local amount = tonumber(menu.eles[2].inputValue)
					if amount == nil then
						ESX.ShowNotification(TranslateCap('invalid_amount'))
					else
						TriggerServerEvent('esx_society:withdrawMoney', society, amount)
						ESX.CloseContext()
					end
				elseif element.value == "deposit_money" then
					local elements = {
						{unselectable = true, icon = "fas fa-wallet", title = TranslateCap('deposit_amount'), description = "Deposit some money into the society account"},
						{icon = "fas fa-wallet", title = "Amount", input = true, inputType = "number", inputPlaceholder = "Amount to deposit..", inputMin = 1, inputMax = 250000, name = "deposit"},
						{icon = "fas fa-check", title = "Confirm", value = "confirm2"},
						{icon = "fas fa-arrow-left", title = "Return", value = "return"}
					}
					ESX.RefreshContext(elements)
				elseif element.value == "confirm2" then
					local amount = tonumber(menu.eles[2].inputValue)
					if amount == nil then
						ESX.ShowNotification(TranslateCap('invalid_amount'))
					else
						TriggerServerEvent('esx_society:depositMoney', society, amount)
						ESX.CloseContext()
					end
				elseif element.value == "wash_money" then
					local elements = {
						{unselectable = true, icon = "fas fa-wallet", title = TranslateCap('wash_money_amount'), description = "Deposit some money into the money wash"},
						{icon = "fas fa-wallet", title = "Amount", input = true, inputType = "number", inputPlaceholder = "Amount to wash..", inputMin = 1, inputMax = 250000, name = "wash"},
						{icon = "fas fa-check", title = "Confirm", value = "confirm3"},
						{icon = "fas fa-arrow-left", title = "Return", value = "return"}
					}
					ESX.RefreshContext(elements)
				elseif element.value == "confirm3" then
					local amount = tonumber(menu.eles[2].inputValue)
					if amount == nil then
						ESX.ShowNotification(TranslateCap('invalid_amount'))
					else
						TriggerServerEvent('esx_society:washMoney', society, amount)
						ESX.CloseContext()
					end
				elseif element.value == "manage_employees" then
					OpenManageEmployeesMenu(society, options)
				elseif element.value == "manage_salary" then
					OpenManageSalaryMenu(society, options)
				elseif element.value == "manage_grades" then
					OpenManageGradesMenu(society, options)
				elseif element.value == "return" then
					OpenBossMenu(society, nil, options)
				end
			end)
		end
	end, society)
end

function OpenManageEmployeesMenu(society, options)
	local elements = {
		{unselectable = true, icon = "fas fa-users", title = TranslateCap('employee_management')},
		{icon = "fas fa-users", title = TranslateCap('employee_list'), value = "employee_list"},
		{icon = "fas fa-users", title = TranslateCap('recruit'), value = "recruit"}
	}
	
	elements[#elements+1] = {icon = "fas fa-arrow-left", title = "Return", value = "return"}
	
	ESX.OpenContext("right", elements, function(menu,element)
		if element.value == "employee_list" then
			OpenEmployeeList(society, options)
		elseif element.value == "recruit" then
			OpenRecruitMenu(society, options)	
		elseif element.value == "return" then
			OpenBossMenu(society, nil, options)
		end
	end)
end

function OpenEmployeeList(society, options)
	ESX.TriggerServerCallback('esx_society:getEmployees', function(employees)
		local elements = {
			{unselectable = true, icon = "fas fa-user", title = "Employees"}
		}

		for i=1, #employees, 1 do
			local gradeLabel = (employees[i].job.grade_label == '' and employees[i].job.label or employees[i].job.grade_label)

			elements[#elements+1] = {icon = "fas fa-user", title = employees[i].name .. " | " ..gradeLabel, gradeLabel = gradeLabel, data = employees[i]}
		end

		elements[#elements+1] = {icon = "fas fa-arrow-left", title = "Return", value = "return"}

		ESX.OpenContext("right", elements, function(menu,element) 
			if element.value == "return" then
				OpenManageEmployeesMenu(society, options)
			else
				local elements2 = {
					{unselectable = true, icon = "fas fa-user", title = element.title},
					{icon = "fas fa-user", title = "Promote", value = "promote"},
					{icon = "fas fa-user", title = "Fire", value = "fire"},
					{icon = "fas fa-arrow-left", title = "Return", value = "return"}
				}
				ESX.OpenContext("right", elements2, function(menu2,element2)
					local employee = element.data
					if element2.value == "promote" then
						ESX.CloseContext()
						OpenPromoteMenu(society, employee, options)
					elseif element2.value == "fire" then
						ESX.ShowNotification(TranslateCap('you_have_fired', employee.name))

						ESX.TriggerServerCallback('esx_society:setJob', function()
							OpenEmployeeList(society, options)
						end, employee.identifier, 'unemployed', 0, 'fire')
					elseif element2.value == "return" then
						OpenEmployeeList(society, options)
					end
				end)
			end
		end)
	end, society)
end

function OpenRecruitMenu(society, options)
	ESX.TriggerServerCallback('esx_society:getOnlinePlayers', function(players)
		local elements = {
			{unselectable = true, icon = "fas fa-user", title = TranslateCap('recruiting')}
		}

		for i=1, #players, 1 do
			if players[i].job.name ~= society then
				elements[#elements+1] = {icon = "fas fa-user", title = players[i].name, value = players[i].source, name = players[i].name, identifier = players[i].identifier}
			end
		end

		elements[#elements+1] = {icon = "fas fa-arrow-left", title = "Return", value = "return"}

		ESX.OpenContext("right", elements, function(menu,element)
			if element.value == "return" then
				OpenManageEmployeesMenu(society, options)
			else
				local elements2 = {
					{unselectable = true, icon = "fas fa-user", title = "Confirm"},
					{icon = "fas fa-times", title = TranslateCap('no'), value = "no"},
					{icon = "fas fa-check", title = TranslateCap('yes'), value = "yes"},
				}
				ESX.OpenContext("right", elements2, function(menu2,element2)
					if element2.value == "yes" then
						ESX.ShowNotification(TranslateCap('you_have_hired', element.name))

						ESX.TriggerServerCallback('esx_society:setJob', function()
							OpenRecruitMenu(society, options)
						end, element.identifier, society, 0, 'hire')
					end
				end)
			end
		end)
	end)
end

function OpenPromoteMenu(society, employee, options)
	ESX.TriggerServerCallback('esx_society:getJob', function(job)
		if not job then
			return
		end

		local elements = {
			{unselectable = true, icon = "fas fa-user", title = TranslateCap('promote_employee', employee.name)}
		}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			elements[#elements+1] = {icon = "fas fa-user", title = gradeLabel, value = job.grades[i].grade, selected = (employee.job.grade == job.grades[i].grade)}
		end

		elements[#elements+1] = {icon = "fas fa-arrow-left", title = "Return", value = "return"}

		ESX.OpenContext("right", elements, function(menu,element)
			if element.value == "return" then
				OpenEmployeeList(society, options)
			else
				ESX.ShowNotification(TranslateCap('you_have_promoted', employee.name, element.title))

				ESX.TriggerServerCallback('esx_society:setJob', function()
					OpenEmployeeList(society, options)
				end, employee.identifier, society, element.value, 'promote')
			end
		end, function(menu)
			OpenEmployeeList(society, options)
		end)
	end, society)
end

function OpenManageSalaryMenu(society, options)
	ESX.TriggerServerCallback('esx_society:getJob', function(job)
		if not job then
			return
		end

		local elements = {
			{unselectable = true, icon = "fas fa-wallet", title = TranslateCap('salary_management')}
		}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			elements[#elements+1] = {
				icon = "fas fa-wallet",
				title = ('%s - <span style="color:green;">%s</span>'):format(gradeLabel, TranslateCap('money_generic', ESX.Math.GroupDigits(job.grades[i].salary))),
				value = job.grades[i].grade
			}
		end
			
		elements[#elements+1] = {icon = "fas fa-arrow-left", title = "Return", value = "return"}

		ESX.OpenContext("right", elements, function(menu,element)
			local elements = {
				{unselectable = true, icon = "fas fa-wallet", title = element.title, description = "Change a grade salary amount", value = element.value},
				{icon = "fas fa-wallet", title = "Amount", input = true, inputType = "number", inputPlaceholder = "Amount to change grade salary..", inputMin = 1, inputMax = Config.MaxSalary, name = "gradesalary"},
				{icon = "fas fa-check", title = "Confirm", value = "confirm"}
			}

			ESX.RefreshContext(elements)
			if element.value == "confirm" then
				local amount = tonumber(menu.eles[2].inputValue)

				if amount == nil then
					ESX.ShowNotification(TranslateCap('invalid_value_nochanges'))
					OpenManageSalaryMenu(society, options)
				elseif amount > Config.MaxSalary then
					ESX.ShowNotification(TranslateCap('invalid_amount_max'))
					OpenManageSalaryMenu(society, options)
				else
					ESX.CloseContext()
					ESX.TriggerServerCallback('esx_society:setJobSalary', function()
						OpenManageSalaryMenu(society, options)
					end, society, menu.eles[1].value, amount)
				end
			elseif element.value == "return" then
				OpenBossMenu(society, nil, options)
			end
		end)
	end, society)
end

function OpenManageGradesMenu(society, options)
	ESX.TriggerServerCallback('esx_society:getJob', function(job)
		if not job then
			return
		end

		local elements = {
			{unselectable = true, icon = "fas fa-wallet", title = TranslateCap('grade_management')}
		}

		for i=1, #job.grades, 1 do
			local gradeLabel = (job.grades[i].label == '' and job.label or job.grades[i].label)

			elements[#elements+1] = {icon = "fas fa-wallet", title = ('%s'):format(gradeLabel), value = job.grades[i].grade}
		end
			
		elements[#elements+1] = {icon = "fas fa-arrow-left", title = "Return", value = "return"}

		ESX.OpenContext("right", elements, function(menu,element)
			local elements = {
				{unselectable = true, icon = "fas fa-wallet", title = element.title, description = "Change a grade label", value = element.value},
				{icon = "fas fa-wallet", title = "Label", input = true, inputType = "text", inputPlaceholder = "Label to change job grade label..", name = "gradelabel"},
				{icon = "fas fa-check", title = "Confirm", value = "confirm"}
			}

			ESX.RefreshContext(elements)
			if element.value == "confirm" then
				if menu.eles[2].inputValue then
					local label = tostring(menu.eles[2].inputValue)

					ESX.TriggerServerCallback('esx_society:setJobLabel', function()
					OpenManageGradesMenu(society, options)
				end, society, menu.eles[1].value, label)
				else
					ESX.ShowNotification(TranslateCap('invalid_value_nochanges'))
					OpenManageGradesMenu(society, options)
				end
			elseif element.value == "return" then
				OpenBossMenu(society, nil, options)
			end
		end)
	end, society)
end

AddEventHandler('esx_society:openBossMenu', function(society, close, options)
	OpenBossMenu(society, close, options)
end)
