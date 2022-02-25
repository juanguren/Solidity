// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract User {
    struct UserData {
        address id;
        string full_name;
        string role;
        string senior;
        uint256 years_exp;
    }

    UserData[] public users;

    function uploadMyself(
        string memory _full_name,
        string memory _role,
        string memory _seniority,
        uint256 years_exp
    ) public {
        UserData memory newUser;

        newUser.id = msg.sender;
        newUser.full_name = _full_name;
        newUser.role = _role;
        newUser.senior = _seniority;
        newUser.years_exp = years_exp;

        users.push(newUser);
    }

    function getUsers() public view returns (UserData[] memory) {
        return users;
    }

    function amIhere() public view returns (bool, string memory) {
        for (uint256 i = 0; i < users.length; i++) {
            if (users[i].id == msg.sender) {
                UserData memory data = users[i];
                return (true, data.full_name);
            }
        }

        return (false, "NO");
    }
}
