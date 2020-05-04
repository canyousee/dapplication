pragma solidity >=0.4.21 <0.7.0;

contract Election {
    // Read/write candidate
    string public candidate;

    // Constructor
    constructor () public {
        candidate = "Candidate 1";
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    //model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    //r/w Candidate
    mapping(uint => Candidate) public candidates;
    //store accounts that have voted
    mapping(address => bool) public voters;
    // store Candidate voteCount
    uint public candidatesCount;

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount]=Candidate(candidatesCount,_name,0);
    }

    //function Election() public view{
      //  addCandidate("Candidate 1");
        //addCandidate("Candidate 2");
    //}


    function vote (uint _candidateId) public {
        require(!voters[msg.sender]);

        require(_candidateId > 0 && _candidateId <= candidatesCount);

        voters[msg.sender]=true;

        candidates[_candidateId].voteCount ++;

        votedEvent(_candidateId);
    }
    
    event votedEvent (
        uint indexed _candidateId
    );
}