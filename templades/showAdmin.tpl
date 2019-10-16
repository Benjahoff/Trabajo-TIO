{include "templates/header.tpl"}
<nav class="navbar navbar-light bg-light">
    <a class="btn btn-outline-dark my-2 my-sm-0 ml-auto" href="logout">LOGOUT</a>
</nav>
<form action="cargaralumno" method="POST">
    <table class="table table-dark">
        <thead>
            <th>
                <label for="nombre">Nombre</label>
            </th>
            <th>
                <label for="apellido">Apellido</label>
            </th>
            <th>
                <label for="dni">DNI</label>
            </th>
            <th>
                <label for="id_especialidad">Especialidad</label>
            </th>
        </thead>
        <tbody>
            <tr>
                <td>
                    <input type="text" name="nombre">
                </td>
                <td>
                    <input type="text" name="apellido">
                </td>
                <td>
                    <input type="text" name="dni">
                </td>
                <td>
                    <select name="id_especialidad" id="id_especialidad">
                        {foreach $especialidades as $especialidad}
                            <option value="{$especialidad->id_especialidad}">{$especialidad->nombre_esp}</option>
                        {/foreach}
                    </select>
                </td>
                <td>
                    <button type="submit">Cargar</button>
                </td>
            </tr>
        </tbody>
    </table>
</form>
<form action="agregarespecialidad" method="POST">
    <table class="table table-dark">
        <thead>
            <th>
                <label for="especialidad">Especialidad</label>
            </th>
        </thead>
        <tbody>
            <tr>
                <td>
                    <input type="text" name="especialidad">
                </td>
                <td>
                    <button type="submit">Agregar</button>
                </td>
            </tr>
        </tbody>
    </table>
</form>
    <table class ="table table-striped">
        <thead>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>DNI</th>
            <th>Especialidad</th>
        </thead>
    <tbody>
        {foreach $students as $student} 
            <tr>
                <td>{$student->nombre}</td>
                <td>{$student->apellido}</td>
                <td>{$student->dni}</td>
                <td>{$student->id_especialidad}</td>
                <form action="eliminarAlumno/{$student->id_alumno}" method="post">
                    <td>
                        <button type="submit">Eliminar</button>
                    </td>
                </form>
                <form action="formularioModificar/{$student->id_alumno}" method="post">
                    <td>
                        <button type="submit">Modificar</button>
                    </td>
                </form>
            </tr>
        {/foreach}
    </tbody>
</table>
{include "templates/footer.tpl"}