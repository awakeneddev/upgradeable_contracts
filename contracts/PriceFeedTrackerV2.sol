// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract PriceFeedTrackerv2 is Initializable {
    address private admin;
    int public price; // new storage slot


    event PriceRetrievedFrom(address feed, int price);

    function initialize(address _admin) public initializer {
        admin = _admin;
    }

    function getAdmin() public view returns (address) {
        return admin;
    }

    function retrievePrice(address feed) public returns (int) {
       require(
           feed != address(0x0),
           "PriceFeedTrackerV2: Pricefeed address must not be zero address."
       );

       AggregatorV3Interface aggregator = AggregatorV3Interface(feed);
       (
           ,
           /*uint80 roundID*/
           int _price, /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/
           ,
           ,

       ) = aggregator.latestRoundData();

       price = _price;

       emit PriceRetrievedFrom(feed, _price);

       return price;
   }
}