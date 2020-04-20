//
//  Calendar.swift
//  
//
//  Created by Apoorva Revankar on 4/18/20.
//

import Foundation


print("\t", "Calendar of 2021\n")

// The array 'monthList' stores months from January to December
var monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "Spetember", "October", "November", "December"]
// The array 'weekDayList' stores days of the week from Monday to Sunday
var weekDayList = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
// Current Month is hardcoded to begin from January
var currentMonth = 0
// Current Week Day is hardcoded to begin from Friday
var currentWeekDay = 4


/* The below function prints the skeleton structure of the Calendar. All the months and weekdays for every month is printed. currentMonthIndex captures each month item is passed as a parameter to the function  */
func displayMonthAndWeekDayTitle(currentMonthIndex:Int){
    print("\t","\t" + monthList[currentMonthIndex])
// Week day is printed by iterating through the weekDayList array.
    for weekDay in weekDayList {
        print(weekDay, terminator:"\t")
    }
    print("\n")
    currentMonth+=1
}

// The below function adds space depending on the starting day of the month. Tabs are added corresponding to the starting day of the month.
func preHeatMonth(monthWeekDayStartIndex:Int){
    for _ in 0..<monthWeekDayStartIndex {
        print("\t", terminator:"")
    }
}

// The below function handles the functionality of printing dates for each month
func printDaysOfMonth(currentMonthIndex:Int, currentWeekDayIndex: inout Int){
    var numberOfDaysInMonth: Int = 0
    var number = 1
// Number of days for each month is hardcoded based on the below logic.
// For months January, March, May, July, August, October and December the number of days is 31.
    if (currentMonthIndex == 1 ||
        currentMonthIndex == 3 ||
        currentMonthIndex == 5 ||
        currentMonthIndex == 7 ||
        currentMonthIndex == 8 ||
        currentMonthIndex == 10 ||
        currentMonthIndex == 12)
    {
        numberOfDaysInMonth = 31
        
    }
// For months April, June, September, November, the number of days is 30.
    else if (currentMonthIndex == 4 ||
        currentMonthIndex == 6 ||
        currentMonthIndex == 9 ||
        currentMonthIndex == 11)
    {
      numberOfDaysInMonth = 30
    }
// For year 2021, February has 28 days. 2021 is not a leap year.
    else if (currentMonthIndex == 2) {
       numberOfDaysInMonth = 28
    }
    
// Function call to display days of the week with appropirate start location.
    preHeatMonth(monthWeekDayStartIndex: currentWeekDayIndex)
    
// The below while loop prints all the number of days based on the variable numberOfDaysInMonth, which is set above.
    while number <= numberOfDaysInMonth {
        print(number, terminator:"\t")
        number+=1
        currentWeekDayIndex+=1
// The below while loop handles breaking the day number/starts to print days from new line after every Sunday.
        if (currentWeekDayIndex % weekDayList.count == 0){
            print(terminator: "\n")
            currentWeekDayIndex = 0
        }
    }
    print("\n")
}

/* The below for loop handles displaying data for all the months. For every month, 2 functions are called displayMonthAndWeekDayTitle and printDaysOfMonth */
for _ in monthList {
    displayMonthAndWeekDayTitle(currentMonthIndex: currentMonth)
 
    printDaysOfMonth(currentMonthIndex: currentMonth, currentWeekDayIndex: &currentWeekDay)
}

