// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract User {
    struct UserData {
        address id;
        string fullName;
        string role;
        string senior;
        uint256 yearsExperience;
    }

    UserData[] public users;

    function uploadMyself(
        string memory _fullName,
        string memory _role,
        string memory _seniority,
        uint256 yearsExperience
    ) public {
        UserData memory newUser;

        newUser.id = msg.sender;
        newUser.fullName = _fullName;
        newUser.role = _role;
        newUser.senior = _seniority;
        newUser.yearsExperience = yearsExperience;

        users.push(newUser);
    }

    function getUsers() public view returns (UserData[] memory) {
        return users;
    }

    function amIhere() public view returns (bool, string memory) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == msg.sender) {
                UserData memory data = users[i];
                return (true, data.fullName);
            }
        }

        return (false, "NO");
    }
}
