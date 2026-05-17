// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Hospital000244328 {

    address public dirContrato = 0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005;

    event MensajeEjecucion(string mensaje);

    modifier mostrarEjecutadoPor() {
        emit MensajeEjecucion("Ejecutado por: 000244328 - CARLOS ALONSO PAREDES QUIROZ");
        _;
    }

    struct Paciente {
        uint id;
        string nombre;
        uint edad;
        bool estado;
    }

    Paciente[] public pacientes;

    constructor() mostrarEjecutadoPor {
    }

    function agregarElemento(uint _id, string memory _nombre, uint _edad, bool _estado) public mostrarEjecutadoPor {
        require(bytes(_nombre).length > 0, "Error: nombre vacio");

        for (uint i = 0; i < pacientes.length; i++) {
            require(pacientes[i].id != _id, "Error: id repetido");
        }

        pacientes.push(Paciente(_id, _nombre, _edad, _estado));
    }

    function contarElementos() public mostrarEjecutadoPor returns (uint) {
        return pacientes.length;
    }

    function obtenerPaciente(uint _index) public mostrarEjecutadoPor returns (uint, string memory, uint, bool) {
        Paciente memory p = pacientes[_index];
        return (p.id, p.nombre, p.edad, p.estado);
    }
}