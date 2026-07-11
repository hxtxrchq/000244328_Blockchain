// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract CalcularNotas {

    function calcularNotaFinal(uint256 teoria, uint256 practica, uint256 laboratorio) public pure returns(uint256){
        uint256 notafinal = (teoria * 30 + practica * 30 + laboratorio*40) / 100 ;
        //uint256 notafinal = (teoria * 10 + practica * 10 + laboratorio*80) / 100 ;
        return notafinal;
    }
}

contract RegistroNotas is Ownable {
    mapping(address => uint256) public notasAlumnos;
    address public addCalculador;

    constructor (address _addCalculadora) Ownable(msg.sender){
        addCalculador = _addCalculadora;
    }

   

    function registrarNota(address _dirAlumno,
            uint256 _teoria, 
            uint256 _practica,
            uint256 _laboratorio) onlyOwner public{

            CalcularNotas calculador = CalcularNotas(addCalculador);

            uint256 notaFinal = calculador.calcularNotaFinal(_teoria, _practica, _laboratorio);
            notasAlumnos[_dirAlumno] = notaFinal;

    }
    function saberMiNota() public view returns(uint256) {
        return notasAlumnos[msg.sender];
    }
    function actualizarCalculadora(address _nuevaCalculadora) public onlyOwner {
        addCalculador = _nuevaCalculadora;
    }
}