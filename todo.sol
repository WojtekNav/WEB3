pragma solidity ^0.8.7;
// SPDX-License-Identifier: MIT

contract ToDo{
    //First  declaring a struct for elements
    struct list {
        string text;
        bool mark;
    }
    // We need a array to include/push our elements into
    list[] public todos;
    // We've got array but its empty. Create func. gonna fill it
    function Create(string calldata _text) public{
        // After function took the message/text we'll push it into list todos.
        todos.push(list(_text,false));
    }

    function Update(uint _index, string calldata _text)public {
        list storage todo = todos[_index];//storage for keeping data
        todo.text=_text;
    }
    //in this func. we take index of object then changing state
    function Marker(uint _index)public{
        list storage todo=todos[_index];
        todo.mark=!todo.mark;
    }
}
