--remember: all turtles do everything to the soundtrack "I Burn" by Jeff Williams
tArgs = {...}
xlength = tonumber(tArgs[1])
ylength = tonumber(tArgs[2])
zlength = tonumber(tArgs[3])


function moveForward()
	checkFuel()
	while not turtle.forward() do
		if turtle.detect() then
			turtle.dig()
			if turtle.detect() then 
				sleep(0.8)
			end
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
 --this is obsolite but im afraid to remove it
function checkDig()
    sleep(.1)
    if (turtle.detect()) == false then
        return
    end
    if turtle.detect() == true then
        turtle.dig()
        checkDig()
        return
    end
end
 
 --i should include a part of this to go back to the original place it was put down, but i think this code barely works as is
 --this is objectivly a bad function name
function handleZ()
    for i =0,zlength
    do
        digArea()
        turtle.digUp()
        turtle.up()
 
    end
end
 
 
function goHome()
    turtle.turnLeft()
    for i = 0, ylength
    do
        moveForward()
    end
    turtle.turnRight()
end
 --checkDig is obsolite but whatever, efficency was not the priority
function digLine()
    for i = 0, xlength
    do
        checkFuel()
        moveForward()
        checkDig()
    end
	turtle.turnLeft()
	turtle.turnLeft()
    for i = 0,xlength
    do
        moveForward()
    end
	--this could just be turnLeft once
	turtle.turnLeft()
    turtle.dig()
    moveForward()
    turtle.turnLeft()
end
 
 
function digArea()
    for i = 0, ylength
    do
        digLine()
    end
    goHome()
end
 
--main
--bad function naming
handleZ()




https://pastebin.com/Gi6ai6MH