// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Hospital000244328 {

    // a) Estructura con 3 atributos, siendo id un entero obligatorio
    struct Paciente {
        uint id;
        string nombre;
        uint edad;
    }

    // Arreglo público del tipo de la estructura
    Paciente[] public pacientes;

    // Función para registrar un paciente
    function guardarPaciente(uint _id, string memory _nombre, uint _edad) public {
        pacientes.push(Paciente(_id, _nombre, _edad));
    }

    // Función para obtener un paciente por índice
    function obtenerPaciente(uint _index) public view returns (uint, string memory, uint) {
        Paciente memory p = pacientes[_index];
        return (p.id, p.nombre, p.edad);
    }

    // Función para obtener la cantidad de pacientes registrados
    function obtenerCantidad() public view returns (uint) {
        return pacientes.length;
    }
}