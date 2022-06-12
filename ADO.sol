// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Elements {

bool upgraded;

    // An ADOWHO is an Record to define You.
    struct adowho {
<<<<<<< Updated upstream
        uint soleId; // This an incremental value that holds the order of ADOWHOs.
        address eTRNId; // This is the address of the account that owns the ADO Token.
    }

    // This is a recording of a TRN spent in the ADO Universe
    struct TRN { 
        uint TRNid; // This is an incremental value that holds the order of TRNs spent.
        uint soleId; // The identifier of the ADOWHO
        address eTRNId; // This is the address of the ADOWHO that used the TRN.
        string action;  // This identifies the type of action for the TRN.
        uint inTRNId; // This is the ID of the action.
=======
        address adowho; // This is the address of the account that owns the ADO Token.
        string callName; // This is the call name of the ADOWHO
        string ADOHash; // This holds the ADO Token hash
        string soleHash; // Upgraded by ADO and the ADOWHO.
    }

    // TRNs are Recordings of trans actions withing the ADO Universe.
    struct TRN {
        uint TRNId; // A counter for TRNs used for ID;
        address adowho; // The address of the ADOWHO giving TRNs;
        uint amount; // This holds the amount of TRNs given.
>>>>>>> Stashed changes
    }

    // Light is tracked when an ADOWHO appreciates a leave.
    struct light {
        uint256 TRNid; // The ID of the TRN recorded.
        uint lightId; // incremental value that holds the ID of the light action.
        address adowho; // ADOWHO that sent light
        uint leaveId; // the ID of the recieving leave
    }

    // BRN is a useless Token. ADO recieves all BRNs
    struct BRN {
        uint dropId; // The ID of the drop used to BRN
        uint BRNId; // An incremental value to ID the BRN
        uint leaveId; // This is leave ID that was BRN-ed
    }
    
    struct branch {
        uint dropId; // The ID of the TRN used to create the Branch.
        uint branchID; // An incremental value to ID the Branch.
        string branchName; // The unique name of the Branch.
        address adowho; // This is the address of who created of the Branch.
        uint fruitID; // The ID of the fruit sprouted by the Branch.
        uint[] leaves; // This should be mapped to handle a LeaveId and not just the count of leaves added.
    }

    struct leave {
<<<<<<< Updated upstream
        uint leave_id; // This is the counter 
=======
        uint dropId; // The ID of the drop used to create the leave.
        uint leaveId; // This is the counter 
>>>>>>> Stashed changes
        hash leaveHash; // This is json data file hash id
        uint branchId; // This is the ID of the orgin branch
        uint stemId; // This holds the stemId the leave is attached to.
        address adowho; // This is the creator of the leave
        uint[] lights; // Array of light interactions
    }

    struct stem {
<<<<<<< Updated upstream
        uint stemId; // The ID of the stem
        uint eTRNId; // The ID of the ADOWHO which created the stem.
        uint leaveId; // The ID of the leave which owns the stem.
        uint[] leaves; // The Leave IDs connected to the stem
    }

    struct fruit {
        uint fruitID; // Fruit counter as ID
        uint branchID; // The branch that created the fruit
        uint juice; // The amount of TRNs accumulated by the Fruit.
    }

    struct seed {
        uint seedId; // The id of the seed produced
        uint eTRNId; // The reciever of the seed
        uint amount; // The amount of TRNs in the seed
    }
    
    struct drop {
        uint dropID; // drop counter.
        hash dropHash; // A holder for an ipfs hash.
        uint eTRNId; // The ID of the ADOWHO which created the drop.
        uint[] branches; // An array to hold multiple branches.
        uint wave; // An identifier of the wave to send the drop.
        bool river; // Trigger for sending to the ADOWHO river.
    }

    struct wave {
        uint waveID; // wave counter.
        uint eTRNId; // creator of the wave.
        uint[] branches; // List of branches in the wave.
    }
    
    struct river {
        uint eTRNId; // This is the owner of the river;
        uint[] eTRNIds; // These are the ADOWHOs in the river;
=======
        uint dropId; // The ID of the drop used to create the stem.
        uint stemId; // Incremental Counter as ID for stems.
        uint leaveId; // The leaveId that the stem is attached to.
        uint branchId; // The branchId of the parent leave.
        uint[] leaves; // Leaves that are attached to the stem.
    }

    struct fruit {
        uint fruitID; // The counter of the Fruits
        uint branchID; // The ID of the branch that sprouted the fruit.
        uint juice; //This keeps track of how big the fruit is.
        address[] adowhos; // This keeps a list of leave owners.
    }

    struct seed {
        uint seedId; // A counter and ID of the seed created.
        address adowho; // The reciever of the seed.
        uint amount; // The amount of TRNs within the seed.
    }

    struct wave {
        uint waveID; // wave counter
        address adowho; // wave Owner
        address[] adowhos; // List of ADOWHOs
>>>>>>> Stashed changes
    }

    struct river {
        uint riverId; // The ID of the river.
        uint adowho; // To whom this river belongs.
        uint[] adowhos; // List of ADOWHOs who are in the river
    }
    
    struct drop {
        uint dropId; // drop counter.
        hash dropHash; // A holder for an ipfs hash.
        uint TRNId; // The ID of the ADOWHO which created the drop.
        uint flowId; // An identifier of the flow to send the drop.
        uint waveId; // An identifier of the wave to send the drop.
        bool river; // Trigger for sending to the river of the ADOWHO.
    }

    struct flow {
        uint flowId; // A Flow between ADOWHOs
        address[] adowhos; // Holds WHOWHOs in the Flow.

        // FOR SECRET FLOWS
        bool hide; // Trigger to turn off Signal
        string sin; // Secret Identification Number
    }

    string[] adowhos;

<<<<<<< Updated upstream
    TRNs[] = TRN; // The currency of life in the ADO Universe
    BRNs[] = BRN; // The punishment for nonsense
    
    drops[] = drop; // Drops are initiated by us.
=======
    TRNs[] = TRN; // Trans act ions in the ADO Universe
    BRNs[] = BRN; // The punishment for un-enlightened leaves
    
    drops[] = drop; // Drops are sent to the ADO Cloud.
>>>>>>> Stashed changes
    lights[] = light; // The light tells us where to go
    branches[] = branch; // This is how we reach our destination
    fruits[] = fruit; // This is the heart of ADO
    seeds[] = seed; // This is the generosity of ADO
    leaves[] = leave; // This is where you make your mark
    stems[] = stem; // This is where you make conversations
     
    waves[] = wave; // This moves us together.
    rivers[] = river; // This flows from us.
<<<<<<< Updated upstream
=======
    news[] = news; // New leaves for adowhos.
>>>>>>> Stashed changes

    uint fertilizer; // This is the current amount of TRNs per seed
    
    

contract Signals is Elements {

    event anew_adowho(
        string "adowho_on"
        address adowho, 
        uint TRNId, 
        uint blockNumber, 
        uint timestamp
    );

    event anew_harvest(
        string "fruit_harvest",
        uint fruitId,
        uint amount,
        uint seeds,
        uint blockNumber,
        uint timestamp,
    );

    event anew_seed(
        string "anew_seed",
        uint pseedId, 
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

    event send_flow(

    );

}

contract ADO_EVO is Elements {

    function drop( address[] _adowho ) {
        
        // GET NEXT DROP ID
        next = drops.length++;

        // TYPE IS BRANCH
        if ( _type == "Branch" ) {

        }

        // TYPE IS LEAVE
        if ( _type == "Leave" ) {

        }

        // TYPE IS WAVE
        if ( _type == "Wave" ) {

        }

        // TYPE IS RIVER
        if ( _type == "River" ) {

        }

        // TYPE IS FLOW
        if ( _type == "Flow" ) {

        }

    }

}

contract ADO_grow is Elements, Signals {

    drop( string _dropHash, address _eTRNId, string _type, uint[] _ids, uint _TRNs ) external ownerOnly returns (uint dropID) {

            // Get the dropID
            count = drops[].length;
            next = count ++;
            uint dropID = next;

            // Verify the adowho
            if ( _eTRNId = adowho.eTRNId[_eTRNId] ) {
                return error("The eTRNId does not exist.");
            }

            // Verify Ownership of eTRNId
            if ( _eTRNId = msg.sender ) {
                return error( "Sender does not own the eTRNId" );
            }       
           
            // SEND TRN to ADO
            bool TRNin = askADO(_ADO_TRN).TRNIntoADO( _TRNs, adowho, "leave", leaveId );
            
            // Type is Wave
            if ( _type == "wave" ) {
                waveId = _ids[0];
                branches = waves[waveId].branches
                for each ( branches.branchIds as branchId ) {
                    sprout_leave(branchId, dropHash);
                }
            }
            
            // Type is Leave
            if ( _type == "leave" ) {
                branchId = _ids[0];
                sprout_leave(branchId, dropHash);
            }
           
            // Type is River
            if ( _type == "river" ) {
                riverId = _ids[0];
                
            }
            
            hash dropHash; // A holder for an ipfs hash.
            uint eTRNId; // The ID of the ADOWHO which created the drop.
            uint[] branches; // An array to hold multiple branches.
            uint wave; // An identifier of the wave to send the drop.
            bool river; // Trigger for sending to the ADOWHO river.
            
            // Save Drop
            
            

    }

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
    };

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
        soakedLeaf = leaves.leavesId[_leaveId];
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

        // GET LEAVE ID
        uint count = leaves[].length;
        uint leaveId = count ++;


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

    };

    function sprout_branch () {

    };

    function sprout_stem () {

    };

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

        //////////////
        adowho vew counter;
        
        ///////////////////////////
        if adowho has viewed 100 leaves;
            request consideration per last leave viewed;

    };

    function getLastBranch() external public returns (uint branchId);

    function sendWave( uint waveId ) external public returns (uint waveId);

    function getNews( address _adowho  ) {

    }
}

contract ADO_DO is ADO {

<<<<<<< Updated upstream
}
=======

function washBRN(uint _amount) {

        //GET LATEST TRN
        uint lastTRN = TRNS.length;
        uint adowho = TRNS[lastTRN].adowho;

        // SWAP BRN TO TRN
        askADO(_ADO_BRN).wash(_amount);

        // DISTRIBUTE TRN TO ADOWHOS
        askADO(_ADO_TRN).TRNOut(_amount, adowho);

    }

    

    

    function harvest(uint fruitId) internal ownerOnly {
        
        // GET FRUIT DATA

        // SEND TRN TO ADOWHOS



        // RESET FRUIT

        // EMIT SQUEEZE Event
    };


}
>>>>>>> Stashed changes
