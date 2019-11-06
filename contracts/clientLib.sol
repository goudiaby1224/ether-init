pragma solidity >=0.4.22 <0.6.0;

import  "./client.sol";

contract ClientProcess{
 
   ClientContract[] private dbClients;
    
   ClientContract[] private trashClients;
    
   event LogClient(uint id, string firstName,string lastName,string expectedDate, string receivedDate, uint price);
    
   constructor() public {
       dbClients.push(new ClientContract(1,"Jeanette","Penddreth","2019-10-14, 10:00","2019-10-14, 12:00",500));
       dbClients.push(new ClientContract(2,"Maria","Penddreth","2019-10-14, 07:00","2019-10-14, 08:00",500));
       dbClients.push(new ClientContract(3,"Maury","Lincoln","2019-10-11, 06:00","2019-10-14, 05:00",500));
       dbClients.push(new ClientContract(4,"Max","Musterman","2019-09-11, 06:0","2019-09-11, 07:30",500));
   }
   
   function getIrregularClient(ClientContract[] memory _dbClients) public returns (ClientContract[] memory){
      return _dbClients; 
   }
   
   function printClients(ClientContract[] memory _dbClients) public {
       
        for (uint i = 0; i<_dbClients.length; i++) {
            emit LogClient(_dbClients[i].getId(), _dbClients[i].getFirstName(), _dbClients[i].getLastName()
            , _dbClients[i].getPlanedDateTime(), _dbClients[i].getArrivedDateTime(), _dbClients[i].getPrice());
        }
   }
   
   
    function updatePriceAccordingDate() public {
        
        for (uint i = 0; i < dbClients.length; i++) {
            uint yearPlanedDate = dbClients[i].extractYear(dbClients[i].getPlanedDateTime());
            uint monthPlanedDate = dbClients[i].extractMonth(dbClients[i].getPlanedDateTime());
            uint dayPlanedDate = dbClients[i].extractDayOfMonth(dbClients[i].getPlanedDateTime());
            uint hourPlanedDate = dbClients[i].extractHourOfDay(dbClients[i].getPlanedDateTime());
            uint minutesPlanedDate = dbClients[i].extractMinutesOfHour(dbClients[i].getPlanedDateTime());
           
            uint planedDateTimeStamp = BokkyPooBahsDateTimeLibrary.timestampFromDateTime(yearPlanedDate, 
               monthPlanedDate, dayPlanedDate, hourPlanedDate, minutesPlanedDate, 0);

            uint yearArrivedDate = dbClients[i].extractYear(dbClients[i].getArrivedDateTime());
            uint monthArrivedDate = dbClients[i].extractMonth(dbClients[i].getArrivedDateTime());
            uint dayArrivedDate = dbClients[i].extractDayOfMonth(dbClients[i].getArrivedDateTime());
            uint hourArrivedDate = dbClients[i].extractHourOfDay(dbClients[i].getArrivedDateTime());
            uint minutesArrivedDate = dbClients[i].extractMinutesOfHour(dbClients[i].getArrivedDateTime());

            uint arrivedDateTimeStamp = BokkyPooBahsDateTimeLibrary.timestampFromDateTime(yearArrivedDate, 
               monthArrivedDate, dayArrivedDate, hourArrivedDate, minutesArrivedDate, 0);
            uint diffHours = BokkyPooBahsDateTimeLibrary.diffHours(planedDateTimeStamp, arrivedDateTimeStamp);
            if(diffHours > 2){
                dbClients[i].setPrice((dbClients[i].getPrice()*5)/10);
                trashClients.push(dbClients[i]);
            }
        }
        printClients(trashClients);
        
    }
    
}