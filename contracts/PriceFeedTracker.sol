// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract PriceFeedTracker is Initializable {
    address private admin;

    function initialize(address _admin) public initializer {
        admin = _admin;
    }

    function getAdmin() public view returns (address) {
        return admin;
    }

    /**
     * Network: Sepolia
     * Aggregator: BTC/USD
     * Address: 0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
     */
    function retrievePrice() public view returns (int) {
        AggregatorV3Interface aggregator = AggregatorV3Interface(
            0x1b44F3514812d835EB1BDB0acB33d3fA3351Ee43
        );
        (
            ,
            /*uint80 roundID*/
            int price /*uint startedAt*/ /*uint timeStamp*/ /*uint80 answeredInRound*/,
            ,
            ,

        ) = aggregator.latestRoundData();

        return price;
    }
}
