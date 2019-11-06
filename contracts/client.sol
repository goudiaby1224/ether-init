pragma solidity >=0.4.22 <0.6.0;

import "./BokkyPooBahsDateTimeContract.sol";
import "./BokkyPooBahsDateTimeLibrary.sol";

contract ClientContract{
    
    uint private  id;
    string private  firstName;
    string private  lastName;
    string private  planedDateTime ;
    string private  arrivedDateTime;
    uint private  price;
    
    function getId ()  public returns (uint)  {
        return id;
    }
   
    
     function setId(uint newId) public {
        id = newId;
    }
    
    
    function getFirstName () public  returns (string memory) {
        return firstName;
    }
    
    function setFirstName(string memory newFirstName) public {
        firstName = newFirstName;
    }
    
    function getLastName() public returns (string memory){
        return lastName;
    }
    
    function setLastName(string memory newLastName ) public{
        lastName = newLastName;
    }
    
    
    function getPlanedDateTime() public returns (string memory){
        return planedDateTime;
    }
    
    function setPlanedDateTime(string memory _planedDateTime) public {
        planedDateTime = _planedDateTime;
    }
    
    function getArrivedDateTime() public returns (string memory){
        return arrivedDateTime;
    }
    
    function setArrivedDateTime(string memory _arrivedDateTime) public {
        arrivedDateTime = _arrivedDateTime;
    }
    
    function getPrice() public returns (uint){
        price;
    }
    
    function setPrice(uint newPrice) public {
        price = newPrice;
    }
    
    
    constructor ( uint _id,string  memory _firstName,string memory _lastName,string memory _planedDateTime,string memory _arrivedDateTime,uint _price) public{
       id = _id;
       firstName = _firstName;
       lastName = _lastName;
       planedDateTime = _planedDateTime;
       arrivedDateTime = _arrivedDateTime;
       price = _price;
    }
    

    function extractValue(string memory strDateTime,uint startIndex,uint lastIndex) public returns (uint) {
      return subString(strDateTime,startIndex,lastIndex);
    }

     function extractValueWithLast(string memory strDateTime,uint startIndex,uint lastIndex) public returns (uint) {
      return subStringLast(strDateTime,startIndex,lastIndex);
    }



    function extractYear(string memory strDateTime) public returns (uint) {
      return subString(strDateTime,0,4);
    }

    function extractMonth(string memory strDateTime) public returns (uint) {
      return subString(strDateTime,5,7);
    }
      
    function extractDayOfMonth(string memory strDateTime) public returns (uint) {
      return subString(strDateTime,8,10);
    }


    function extractHourOfDay(string memory strDateTime) public returns (uint) {
      return subString(strDateTime,11,13);
    }


    function extractMinutesOfHour(string memory strDateTime) public returns (uint) {
      return subStringLast(strDateTime,14,15);
    }

    function subString(string memory str, uint256 startIndex, uint256 endIndex)   public returns (uint) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return bytesToUint(result);
    }
    
    function subStringLast(string memory str, uint startIndex, uint endIndex)   public returns (uint) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i <= endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return bytesToUint(result);
    }

    
    function bytesToUint(bytes memory b) public returns (uint256){
        uint256 number;
        for( uint i = 0;i<b.length;i++ ){
            number = number + uint(uint8(b[i]))*(2**(8*(b.length-(i+1))));
        }
        return number;
    }
   

  
    
}