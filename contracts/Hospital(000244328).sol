// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Hospital000244328 {

    address public dirContrato = 0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8;

    struct Paciente {
        uint id;
        string nombre;
        uint edad;
    }

    Paciente[] public pacientes;

    function agregarElemento(uint _id, string memory _nombre, uint _edad) public {
        pacientes.push(Paciente(_id, _nombre, _edad));
    }

    function contarElementos() public view returns (uint) {
        return pacientes.length;
    }

    function obtenerPaciente(uint _index) public view returns (uint, string memory, uint) {
        Paciente memory p = pacientes[_index];
        return (p.id, p.nombre, p.edad);
    }
}