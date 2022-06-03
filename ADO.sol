ERC20
ERC721
ERC1155
Governor
 Copy to Clipboard
 Open in Remix
 Download
settings
Name
ADO_WHO
Symbol
ADO
Base URI
https://...
features
Mintable
Auto Increment Ids
Burnable
Pausable
Votes
Enumerable
URI Storage
access control
Ownable
Roles
upgradeability

Transparent
UUPS
info
Security Contact
security@example.com
License
MIT
 Forum
 Docs
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Elements {

    //This is a record of a TRN in the ADO Universe
    struct TRN { 
        uint TRNid;
        address adowho;
        string action; 
        uint[] inTRNId;       
    }

    //dropHash will point to json
    struct light {
        uint256 TRNid;
        uint lightId; // light counter
        address adowho; // ADOWHO that sent light
        uint amount // amount of TRNs in light
        uint leaveId // the ID of the recieving leave
    }

    struct BRN_t {
        uint TRNid;
        uint BRNId;
        address adowho; // This is the adowho who BRN-ed a leave
        uint leaveId; // This is leave ID that was BRN-ed
        uint TokenId; // This is the TokenID BRN Token
        bool exists; // This will kill the BRN Token
    }

    struct branch {
        uint TRNid;
        uint branchID // 
        string branchName
        hash branchHash
        address adowho
        uint fruitID;
        uint[] leaves;
    }

    struct leave {
        uint TRNid;
        uint leave_id; // This is the counter 
        hash leaveHash; // This is json data file hash id
        string branchID; // This is the ID of the orgin branch
        address adowho; // This is the creator of the branch
        uint[] lightIDs; // Array of light interactions
    }

    struct stem {
        uint stemId;
        uint leaveId;
        uint branchId;
        uint[] leavesIds;

    }

    struct fruit {
        uint fruitID;
        uint branchID;
        hash fruitHash; 
        uint totalSupply; //This keeps track of how big the fruit is.
        address[] adowhos; // This keeps a list of leave owners.
    }

    struct seed {
        uint seedId;
        address adowho;
        uint amount;
    }

    struct wave {
        uint waveID; // wave counter
        hash waveHash; // Hash ID of 
        address adowho; // wave Owner
        address[] adowhos; // List of ADOWHOs
    }

    waves[] = wave;
    leaves[] = leave;
    stems[] = stem;
    seeds[] = seed;
    fruits[] = fruit;
    branches[] = branch;
    lights[] = light;
     
    BRNs[] = BRN;

    event fruit_created();
    event fruit_eaten();
    event seed_harvested();
    event seed_planted();
    event leave_grown()

    function plant() {

        // MINT ADOWHO

        // SEED ADOWHO with TRN

        // EMIT NEW ADOWHO Event
    }

    function light() ownerOnly payable {

        // SEND TRN to ADO

        // ADD Light to Fruit

        // ADD Light to leave 

        // SEND TRN to leave owner

        // EMIT Light Event
    };

    function BRN() ownerOnly {

        // SEND TRN to ADO

        // SWAP TRN for BRN

        // EMIT BRN Event
    };

    function leave() {

        // SEND TRN TO ADO

        // CREATE new LEAVE

        // ADD LEAVE TO BRANCH

        // EMIT LEAVE Event
    }

    function wash() {

        // SWAP BRN TO TRN

        // DISTRIBUTE TRN TO ADOWHOS
    }

    function eat() {
        
        // GET FRUIT DATA

        // SEND TRN TO ADOWHOS

        // RESET FRUIT

        // EMIT SQUEEZE Event
    };

    function sync(bool _with, address _adowho, string _waveName, uint _waveId ) {

        // ADD ADOWHO TO WAVE
            // check if WAVE exists

        // REMOVE ADOWHO FROM WAVE
    };



}
