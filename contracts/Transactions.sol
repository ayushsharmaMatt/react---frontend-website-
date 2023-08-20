// SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 <0.9.0;

contract StudentData {
    struct Student {
        string name;
        uint256 age;
        string[] subjects;
        uint256[] marks;
        bool exists;
    }

    mapping(address => mapping(string => Student)) private studentData;

    function addStudentData(string memory _name, uint256 _age, string[] memory _subjects, uint256[] memory _marks) public {
        require(studentData[msg.sender][""].exists == false, "Student data already exists.");

        Student memory newStudent = Student(_name, _age, _subjects, _marks, true);
        studentData[msg.sender][""] = newStudent;
    }

    function updateStudentData(string memory _name, uint256 _age, string[] memory _subjects, uint256[] memory _marks) public {
        require(studentData[msg.sender][""].exists == true, "Student data does not exist.");

        Student memory existingStudent = studentData[msg.sender][""];
        existingStudent.name = _name;
        existingStudent.age = _age;
        existingStudent.subjects = _subjects;
        existingStudent.marks = _marks;

        studentData[msg.sender][""] = existingStudent;
    }

    function getStudentData() public view returns (string memory, uint256, string[] memory, uint256[] memory) {
        require(studentData[msg.sender][""].exists == true, "Student data does not exist.");

        Student memory existingStudent = studentData[msg.sender][""];
        return (existingStudent.name, existingStudent.age, existingStudent.subjects, existingStudent.marks);
    }
}
