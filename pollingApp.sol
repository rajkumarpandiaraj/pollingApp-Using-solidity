// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Polling{
    address public owner;
    mapping(string => uint) polls ;
    bool isPollStarted = false;
    bool isPollStopped= false;


    constructor() {
        owner = msg.sender;
    }

    function startPolling() public {
        require(owner == msg.sender, "Only owner can start the poll");
        require(!isPollStarted, "Poll already started");
        isPollStarted = true;
        polls["Briyani"] = 0;
        polls["Parotta"] = 0;

    }
    function stopPolling() public {
        require(owner == msg.sender, "Only owner can stop the poll");
        require(isPollStarted, "Poll not start yet");
        require(!isPollStopped, "Poll already stopped");
        isPollStopped = true;
       

    }

    function voteBriyani() public{
        require(isPollStarted, "Poll not yet started");
        require(!isPollStopped,"Poll ended");
        polls["Briyani"] += 1;
    }

    function voteParotta() public{
        require(isPollStarted, "Poll not yet started");
        require(!isPollStopped,"Poll ended");
         polls["Parotta"] += 1;
    }

    function getPollResult() public view returns(string memory){
         require(isPollStarted, "Poll not yet started");
        require(isPollStopped,"Poll not yet ended");
        if(polls["Parotta"] > polls["Briyani"]){
            return "Parotta won";
        }else{
             return "Briyani won";
        }
    }

}