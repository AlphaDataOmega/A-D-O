// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721URIStorage.sol";

/**
 * @title ADOWHO
 * @dev Create a SOUL BOUND ADOWHO
 */
contract ADOWHO is ERC721URIStorage  {

    address owner;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721( "ADOWHO", "ADO" ) {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    mapping(address => string ) public adoHash;
    mapping(address => string ) public selfHash;
    mapping(address => bool) public exists;

    //
    mapping(address => uint256 ) public branches;
    mapping(address => uint256 ) public leaves;
    mapping(address => uint256 ) public stems;
    //
    mapping(address => uint256 ) public waves;
    mapping(address => uint256 ) public rivers;
    mapping(address => uint256 ) public flows;
    //

    event adowho_on( uint256 aNewADO, string adoHash );
    event newSelf( uint256 aNewADO, string oldSelf, string selfHash );

    function adowho_on( string memory adoHash, string memory selfHash ) public returns (uint256) {

        if ( exists[msg.sender] ) {
            error("ADO ALREADY RECORDING");
        };

        _tokenIds.increment();

        uint256 adowho_is = _tokenIds.current();
        _mint(msg.sender, adowho_is);
        _setTokenURI(adowho_is, selfHash);

        adoHash[msg.sender] = adoHash;
        soleHash[msg.sender] = selfHash;
        isANew[msg.sender] = false;
        exists[msg.sender] = true;

        emit adowho_on(adowho_is, selfHash);

        return adowho_is;

    }

    function adowhoExists( address _adowho ) external view returns (bool memory) {
        require( exists[_adowho], false );
        return true;
    }

    function getADOHash() external view returns (string memory) {
        require( exists[msg.sender], "UNKNOWN" );
        return adoHash[msg.sender];
    }

    function getSelfHash( address _adowho ) external view returns (string memory) {
        require( exists[msg.sender], "YOU ARE NOT AN ADOWHO" );
        require( exists[_adowho], "UNKNOWN" );
        return selfHash[_adowho];
    }

    function selfUpdate( address adowho, string _newSelf ) external view returns (string memory) {

        require(msg.sender == adowho, "YOU CAN ONLY CHANGE YOUR SELF");

        oldSelf = selfHash[adowho];
        selfHash[adowho] = _newSelf;

        emit newSelf( );
    }

}

contract Commands {

    //Set Permissions for ADO
    address ADO;
    constructor() { ADO = msg.sender; }
    modifier onlyADO() { require(msg.sender == ADO); _; }

    // Placeholder for all the external contract addresses. 
    address adoElementsContract;
    address adoFluidContract;
    address adoTRNContract;
    address adoBRNContract;
    address adowhoContract;
    address adoBranchContract;
    address adoLeaveContract;

    // Allows for Updates
    bool updated;
    address updatedContract;
    event updatedContract(string _name; address _oldAddress, address _newAddress);
    function adoUpdate( string _name, address _newAddress ) external private onlyADO {
        if ( _name == "adowhoContract" ) {
            oldAddress = adowhoContract;
            adowhoContract = _newAddress;
            emit updatedContract( _name, oldAddress, _newAddress);
        }
        if ( _name == "adoBranchContract" ) {
            oldAddress = adoBranchContract;
            adoBranchContract = _newAddress;
            emit updatedContract( _name, oldAddress, _newAddress);
        }
        if ( _name == "adoLeaveContract" ) {
            oldAddress = adoLeaveContract;
            adoLeaveContract = _newAddress;
            emit updatedContract( _name, oldAddress, _newAddress);
        }
        if ( _name == "adoTRNContract" ) {
            oldAddress = adoTRNContract;
            adoTRNContract = _newAddress;
            emit updatedContract( _name, oldAddress, _newAddress);
        }
        if ( _name == "adoBRNContract" ) {
            oldAddress = adoBRNContract;
            adoBRNContract = _newAddress;
            emit updatedContract( _name, oldAddress, _newAddress);
        }
        if ( _name == "adoCommands" ) {
            oldAddress = adoBRNContract;
            adoBRNContract = _newAddress;
            emit updatedContract( _name, oldAddress, _newAddress);    
        }
    }

    // Allow only recorded Adowhos
    modifier adoExists() {
        require(askADO(adowhoContract).adowhoExists(msg.sender));
        _;
    }

    function anew_adowho(string _adoHash, string _selfHash) onlyADO external payable {
        
        //MINT NEW ADOWHO
        adowho = askADO(adowhoContract).adowho_on(_adoHash, _selfHash);

        //SAVE ADOWHO In Elements
        
    }
    
    // Sprout New Branch
    function sprout_branch( string _name, string _branchHash ) adoExists public returns (uint256) {
        
        //Require Branch Name does not Exist
        exists = askADO(adoBranchContract).branchExists(_name);
        if (exists) { newBranch = true; };
        require( newBranch, "BRANCH EXISTS" );

        //Mint New Branch Token
        branchId = askADO(adoBranchContract).adoBranch_on( _name, _branchHash );

        //Mint New Fruit Token
        fruitId = askADO( adoFruitContract ).adoFruit_on( branchId );

        //Set Initial Luminary
        askADO(adoBranchContract).adoLuminary(branchId, msg.sender);

        //Save Branch Details

        //Save Fruit Details
    }

    function sprout_leave( uint256 _branchId, string _leaveHash ) adoExists public returns (uint256) {

        //Mint Leave Token
        leaveId = askADO(adoLeaveContract).adoLeave_on( _branchId, _leaveHash );

        //Save Leave Details

    }

    function sprout_stem(uint256 _leaveId, string _name) adoExists public returns (uint256) {

        //Require ADOWHO is Leave Owner
        isOwner = askADO(adoLeaveContract).isOwner(_leaveId, msg.sender);
        require(isOwner, "YOU DO NOT OWN THIS LEAVE");

        //Add Stem to Leave
        stemId = askADO(adoLeaveContract).addStem(_leaveId, _name);

        //Save Stem Details to Leave
    } 

    function stem_leave( uint256 _leaveId, uint256 _stemId, string _dropHash ) adoExists public returns (uint256) {

        //Require ADOWHO is Leave Owner
        isOwner = askADO(adoLeaveContract).isOwner(_leaveId, msg.sender);
        require(isOwner, "YOU DO NOT OWN THIS LEAVE");

        //Add Leave to Stem
        stemId = askADO(adoLeaveContract).stemLeave(_leaveId, _stemId, _dropHash);

        //Save Leave Details
    }    

}

contract Elements {

    //TRN Prices
    uint256 perBranch;
    uint256 perLeave;
    uint256 perStem;
    uint256 perWash;
    uint256 perLight;

    //TRN Percentages
    uint256 percentageLuminary;
    uint256 percentageSeed;
    uint256 percentageFruit;
    uint256 percentageGrower;

     // An ADOWHO is an Record to define You.
    struct adowho {
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
        uint dropId; // The ID of the drop used to create the leave.
        uint leaveId; // This is the counter 
        hash leaveHash; // This is json data file hash id
        uint branchId; // This is the ID of the orgin branch
        uint stemId; // This holds the stemId the leave is attached to.
        address adowho; // This is the creator of the leave
        uint[] lights; // Array of light interactions
    }

    struct stem {
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
        string dropHash; // A holder for an ipfs hash.
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
        uint riverId; // The ID of the river.
        uint adowho; // To whom this river belongs.
        uint[] adowhos; // List of ADOWHOs who are in the river
    }
    
    struct drop {
        uint dropId; // drop counter.
        string dropHash; // A holder for an ipfs hash.
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

}

// A Public Contract for ADOWHOs
contract Fluid {


    drop(string _type, uint256[] _ids, string _name, string dropHash, uint256 _amount) adoExists public {
        
        if ( _type == "stem") {
            leaveId = _ids[0];
            askADO(adoCommandsContract).sprout_leave( leaveId, _dropHash );
        }

        if (_type == "branch") {
            branchName = _name;
            askADO(adoCommandsContract).sprout_branch( branchName, _dropHash );
        }

        if (_type == "leave") {
            
            //Leave on Stem
            if (_ids.length == 1) {
                stemId = _ids[0];
                branchId = _ids[1];
                askADO(adoCommandsContract).stem_leave( stemId, _dropHash );
            } else { // Leave on Branch
                branchId = _ids[0];
                askADO(adoCommandsContract).sprout_leave( branchId, _dropHash );
            }

            
        }

    }

    shedLight();
}

newFlow 

Owners
sin
ViewFlow
