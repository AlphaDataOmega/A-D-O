// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Elements {

    struct adowho {
        uint soleId;
        address owner;
        uint adowhoTokenId;
    }

    // This is a record of a TRN in the ADO Universe
    struct TRN { 
        uint TRNid;
        address soleId;
        string action; 
        uint[] inTRNId;       
    }

    // 
    struct light {
        uint256 TRNid;
        uint lightId; // light counter
        address adowho; // ADOWHO that sent light
        uint amount; // amount of TRNs in light
        uint leaveId; // the ID of the recieving leave
    }

    struct BRN {
        uint TRNid;
        uint BRNId;
        address adowho; // This is the adowho who BRN-ed a leave
        uint leaveId; // This is leave ID that was BRN-ed
        uint TokenId; // This is the TokenID BRN Token
        bool exists; // This will kill the BRN Token
    }

    struct branch {
        uint TRNid;
        uint branchID; // 
        string branchName;
        hash branchHash;
        address adowho;
        uint fruitID;
        uint[] leaves; // ?? This should be mapped to handle a LeaveId and not just the count of leaves added.
    }

    struct leave {
        uint TRNid;
        uint leave_id; // This is the counter 
        hash leaveHash; // This is json data file hash id
        string branchID; // This is the ID of the orgin branch
        address adowho; // This is the creator of the branch
        uint[] lights; // Array of light interactions
    }

    struct stem {
        uint TRNid;
        uint stemId;
        uint leaveId;
        uint branchId;
        uint[] leaves;

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

    string[] adowhos;

    TRNs[] = TRN;
    BRNs[] = BRN;
    
    lights[] = light; // The light tells us where to go
    branches[] = branch; // This is how we reach our destination
    fruits[] = fruit; // This is the heart of ADO
    seeds[] = seed; // This is the generosity of ADO
    leaves[] = leave; // This is where you make your mark
    stems[] = stem; // This is where you make friends
     
    waves[] = wave; // This controls our flow

    uint fertilizer; // This is the current amount of TRNs per seed

}

contract Signals is Elements {

    event adowho(
        string "adowho_on"
        address adowho, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

    event harvest_fruit(
        string "fruit_harvest",
        uint fruitId,
        uint amount,
        uint seeds,
        uint blockNumber,
        uint timestamp,
    );

    event plant_seed(
        string "anew_plant",
        uint plantId, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

    event sprout_fruit(
        string "anew_fruit",
        uint fruitId, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

    event sprout_branch(
        string "anew_brach",
        uint branchId, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

    event sprout_leave(
        string "anew_leave",        
        uint leaveId, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

    event sprout_stem(
        string "anew_stem",
        uint stemId, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

    event make_wave(
        string "anew_wave",
        uint waveId, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

}

contract Powers is Elements, Signals {

    function adowho_on(address _ADO, address _adoWho, hash _adoHash) onlyOwner returns (uint ) {

        //Verify Signature
        askADO(_ADO).verifySignature();

        //Verify New Owner
        if ( adowho.owner[_adowho] == _adowho ) {
            return error("This address already owns an ADO Token.");
        }

        //Verify Hosh
        if ( adowho.adoHash[_adoHash] == _adoHash ) {
            return error("This hash has already been recorded")
        }

        // MINT the ADO Token
        askADO(_ADO).mint(_adowho, _adoHash);

        // ADD ADOWHO to Memory
        uint count = adowhos.length;
        uint next = count ++;
        adowho.push( next , _adowho );

        // TRANSFER TRN TO NEW ADOWHO
        askADO(_ADO_TRN).TRNOut(_adowho, fertalizer,); 

        // ADD SEED TO MEMORY
        uint count = seeds.length;
        uint next = count ++;
        seed.push( next , _adowho , fertalizer );

        // EMIT Signals
    }

    function light() ownerOnly payable {

        // SEE TRN
        uint count = TRNS.length;
        uint TRNid = count ++;

        // SEE LIGHT
        uint count = lights.length;
        uint lightId = count ++;

        // BREAK UP LIGHT
        uint lightIn = _amount;
        uint lightOut = light_in / 100 * 90;
        uint lightLeft = light_in / 100 * 10;

        // SEND TRN to ADO
        askADO(_ADO_TRN).TRNIntoADO(adowho, lightLeft, "light", lightId);

        // ADD Light to Fruit
        uint soakedBranch = leaves.leaveId[_leaveId].branchId;
        uint absorbFruit = branchs.branchId[soakedBranch].fruitId;
        uint juice = fruits[absorbFruit].juice + lightLeft;
        fruits[absorbFruit].juice = juice;

        // ADD Light to leave
        uint soakedLeaf = leaves.leavesId[_leaveId];
        soakedLeaf.lightIDs.push(lightID)

        // SEND TRN to leave owner
        address luminaries = askSentinals(_SENTINAL).vote(_leaveId);
        address luminary = soakedLeaf.adowho;
        askADO(_ADO).TRNin(adowho, lightOut, luminary);

        // REMEMBER LIGHT
        lights.push(lightId, TRNId, _adowho, _amount, _leaveId);
        
        //REMEMBER TRN
        TRNS.push(next, _adowho, 'light', _lightId);

        // EMIT Light Event
    };

    function BRN() external ownerOnly {

        // SEE TRN
        uint count = TRNS.length;
        uint TRNId = count ++;

        // Start BRN
        uint count = BRNS.length;
        uint BRNId = count ++;

        // SWAP TRN for BRN then transfer BRN to ADO
        askADO(_ADO_BRN).BRNIn(_amount, adowho);

        //REMEMBER TRN
        TRNS.push(next, _adowho, 'light', _lightId);

        // EMIT BRN Event
    };

    function sprout_leave() external ownerOnly {

         // SEE TRN
        uint count = TRNS.length;
        uint TRNId = count ++;

        // SEE LEAVE
        uint count = leaves[].length;
        uint leaveId = count ++;

        // SEND TRN to ADO
        askADO(_ADO_TRN).TRNIntoADO( _amount, adowho, "leave", leaveId );

        // CREATE LEAVE
        askADO(_ADO_Leave).mint( _leave, _leaveHash, _adowho);

        // ADD LEAVE TO BRANCH
        Branches[_branchId].leaves.push(leaveId);

        //REMEMBER LEAVE
        Leaves[].push(leaveId, TRNId, _leaveHash, _branchId, _adowho);

        //REMEMBER TRN
        TRNS.push(next, _adowho, 'light', _lightId);

        // EMIT LEAVE Event
        emit sprout_leave(TRNId, leaveId);

    }

    function wash(uint _amount) {

        //GET LATEST TRN
        uint lastTRN = TRNS.length;
        uint adowho = TRNS[lastTRN].adowho;

        // SWAP BRN TO TRN
        askADO(_ADO_BRN).wash(_amount);

        // DISTRIBUTE TRN TO ADOWHOS
        askADO(_ADO_TRN).TRNOut(_amount, adowho);

    }

    function eat(uint fruitId) internal ownerOnly {
        
        // GET FRUIT DATA

        // SEND TRN TO ADOWHOS



        // RESET FRUIT

        // EMIT SQUEEZE Event
    };

    function sprout_branch();

    function sync(bool _with, address _adowho, string _waveName, uint _waveId ) {

        // ADD ADOWHO TO WAVE
            // check if WAVE exists

        // REMOVE ADOWHO FROM WAVE
    };



}

contract COMMANDS is Elements {

    function getLeaveIdFromBranchByOrder(uint _branchId, uint _order) external public view returns (uint leaveId ) {
        branch = Branches[_branchId];
        leaveId = branch.leaves[_order];
    };
    
    function viewTotalBranchLeaves(uint _branchId) external public view returns (uint totalLeaves) {
        branch = Branches[_branchId]
        totalLeaves = branch.leaves[].length;
    };

    function viewLeave(uint _leaveId) external public view returns (hash leaveHash) {
        leaveHash = leaves[_leaveId].leaveHash;
    };

    function getLuminaries(uint _branchId) external public returns (address[] _adowhos);

    function getLastBranch() external public returns (uint branchId);

    function sendWave( uint waveId ) external public returns (uint waveId);

}

contract ADO_DO is ADO {

}
