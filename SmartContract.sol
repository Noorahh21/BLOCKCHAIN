// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Simple Voting dApp
/// @notice Owner adds candidates, anyone with a wallet can vote once.
contract SimpleVoting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    address public owner;
    Candidate[] private candidates;
    mapping(address => bool) public hasVoted;

    event CandidateAdded(uint256 indexed id, string name);
    event Voted(address indexed voter, uint256 indexed candidateId);

    constructor() {
        owner = msg.sender;
    }

    // WRITE 1: only the owner can add a candidate
    function addCandidate(string memory _name) public {
        require(msg.sender == owner, "Only owner can add candidates");
        require(bytes(_name).length > 0, "Name cannot be empty");
        candidates.push(Candidate(_name, 0));
        emit CandidateAdded(candidates.length - 1, _name);
    }

    // WRITE 2: each wallet can vote only once
    function vote(uint256 _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId < candidates.length, "Invalid candidate");
        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount += 1;
        emit Voted(msg.sender, _candidateId);
    }

    // READ 1: how many candidates exist
    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    // READ 2: get one candidate's name and votes
    function getCandidate(uint256 _id) public view returns (string memory, uint256) {
        require(_id < candidates.length, "Invalid candidate");
        return (candidates[_id].name, candidates[_id].voteCount);
    }

    // READ 3: who is currently leading
    function getWinner() public view returns (string memory, uint256) {
        require(candidates.length > 0, "No candidates yet");
        uint256 best = 0;
        for (uint256 i = 1; i < candidates.length; i++) {
            if (candidates[i].voteCount > candidates[best].voteCount) {
                best = i;
            }
        }
        return (candidates[best].name, candidates[best].voteCount);
    }
}
