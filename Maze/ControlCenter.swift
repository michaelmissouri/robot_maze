//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(robot: ComplexRobotObject) {
        
        let robotIsBlocked = isFacingWall(robot, direction: robot.direction)
        
        // Step 2.1c
        // TODO: Save the return value of checkWalls() to a constant called myWallInfo.
        
        let wallInfo = checkWalls(robot)
        
        // Step 2.2a
        // Categorize the robot's current location based on the number of walls
        
        // Uncomment the line of code below
        let isThreeWayJunction = (wallInfo.numberOfWalls == 1)
        
        // TODO: Define the constant, isTwoWayPath
        let isTwoWayPath = (wallInfo.numberOfWalls == 2)
        
        // TODO: Define the constant, isDeadEnd
        let isDeadEnd = (wallInfo.numberOfWalls == 3)
        
        // Step 2.2b
        // Test whether the values of the above constants are correct
//        if isThreeWayJunction {
//            print (true)
//        } else {
//            print (false)
//        }
//        
//        if isTwoWayPath {
//            print (true)
//        } else {
//            print (false)
//        }
//        
//        if isDeadEnd {
//            print (true)
//        } else {
//            print (false)
//        }
        
        // Step 2.3a
        // Three-way Path - else-if statements
        
        // TODO: If the robot encounters a three way junction and there IS a wall ahead, it should randomly rotate right or left. Uncomment the code below.
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(robot)
        }
            
            // TODO: If the robot encounters a three way junction and there is NO wall ahead, it should continue straight or rotate (you need to write this else-if statement)
            
        else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(robot, wallInfo: wallInfo)
        }
            
            // Step 2.3b
            // Two-way Path - else-if statements
            
            // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        else if isTwoWayPath && !robotIsBlocked {
            robot.move()
        }
            
            // TODO: If the robot encounters a two way path and there IS a wall ahead, it should randomly rotate.
            
        else if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(robot, wallInfo: wallInfo)
        }
            
            // Step 2.3c
            // Dead end - else-if statements
            
            // TODO: If the robot encounters a dead end and there is NO wall ahead it should move forward.
            
        else if isDeadEnd {
            if !robotIsBlocked {
            robot.move()
            } else {
                robot.rotateLeft()
            }
        }

      
    // You may want to paste your Part 2 implementation of moveComplexRobot() here

        
        // Step 3.2
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should turn in the direction of the clear path.
        
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}