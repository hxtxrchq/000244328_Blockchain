// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Hospital000244328 {

    address public dirContrato = 0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005;
    uint256 public cantidad;

    event MensajeEjecucion(string mensaje);
    event ElementoActivo(uint id, string nombre, uint edad, bool estado);
    event ElementoImpar(uint id, string nombre, uint edad, bool estado);

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

    mapping(uint => Paciente) public pacientes;

    constructor() mostrarEjecutadoPor {
    }

    function agregarElemento(uint _id, string memory _nombre, uint _edad, bool _estado) public mostrarEjecutadoPor {
        require(bytes(_nombre).length > 0, "Error: nombre vacio");
        require(pacientes[_id].id == 0, "Error: id repetido");

        pacientes[_id] = Paciente(_id, _nombre, _edad, _estado);
        cantidad++;
    }

    function contarElementos() public mostrarEjecutadoPor returns (uint256) {
        return cantidad;
    }

    function obtenerPaciente(uint _id) public mostrarEjecutadoPor returns (uint, string memory, uint, bool) {
        Paciente memory p = pacientes[_id];
        require(p.id != 0, "Error: paciente no existe");
        return (p.id, p.nombre, p.edad, p.estado);
    }

    function inactivarElemento(uint _id) public mostrarEjecutadoPor {
        require(pacientes[_id].id != 0, "Error: paciente no existe");
        pacientes[_id].estado = false;
    }

    function mostrarActivos() public mostrarEjecutadoPor {
        for (uint i = 1; i <= cantidad; i++) {
            if (pacientes[i].id != 0 && pacientes[i].estado == true) {
                emit ElementoActivo(
                    pacientes[i].id,
                    pacientes[i].nombre,
                    pacientes[i].edad,
                    pacientes[i].estado
                );
            }
        }
    }

    function mostrarIdImpar() public mostrarEjecutadoPor {
        for (uint i = 1; i <= cantidad; i++) {
            if (pacientes[i].id != 0 && pacientes[i].id % 2 != 0) {
                emit ElementoImpar(
                    pacientes[i].id,
                    pacientes[i].nombre,
                    pacientes[i].edad,
                    pacientes[i].estado
                );
            }
        }
    }
}