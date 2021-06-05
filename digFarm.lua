--digs a 9x9 area for clearing a farm
leftRight = 0 --0 for turn right 1 for turn left

function moveForward()
while not turtle.forward() do
		checkFuel()
		if turtle.detect() then
			turtle.dig()
			--[[if turtle.detect() then 
				sleep(0.8)
			--end]]
		end
		--i dont think this works
		if turtle.attack() then
			print("Mob infront was attacked")
		end
	end
end

function checkFuel()
    if turtle.getFuelLevel() < 20 then
	while turtle.getFuelLevel() < 20 do
        print(turtle.getFuelLevel)
        print('turtle is refueling!')
        turtle.refuel(1)
		if turtle.getFuelLevel() > 20 then 
			return 1 
		else
			for i =1,16
				do
				turtle.select(i)
				turtle.refuel(1)
				if turtle.getFuelLevel() > 20 then
					turtle.select(1)
					return
				end
			end
		end
		
		end
    end
end

moveForward()
for i =1,9
	do
		for j=1,8
			do
			moveForward()
		end
	if i ~= 9 then 
		if leftRight == 0 then
			turtle.turnRight()
			moveForward()
			turtle.turnRight()
			leftRight = 1
		else
			turtle.turnLeft()
			moveForward()
			turtle.turnLeft()
			leftRight = 0
		end
	end
end
