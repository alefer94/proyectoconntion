<?php



require_once '../../conexion.php';
require_once 'fpdf/fpdf.php';
// Pie de página



$pdf = new FPDF('P', 'mm', 'letter');

$pdf->AddPage();

// Comienza con fuente regular

$pdf->SetFont('Arial', '', 8);
$pdf->text(140,28, 'BALANZAS Y SISTEMAS DE PESAJE INDUSTRIALES');
$pdf->text(140,32, '- FAJAS TRANSPORTADORAS Y RODILLOS');
$pdf->text(140,36, 'EQUIPOS Y MAQUINARIA PARA LA AGROINDUSTRIA');
$pdf->text(140,40, utf8_decode('AUTOMATIZACIÓN INDUSTRIAL Y PROYECTOS
'));

$pdf->SetFont('Arial', 'B', 11);

// Definir los nombres de los meses en español
$meses = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
];

// Obtener la fecha actual
$fecha_actual = date('d') . ' de ' . $meses[date('n') - 1] . ' del ' . date('Y');
$pdf->SetY(45);
$pdf->Cell(0, 10, 'Lima, ' . $fecha_actual, 0, 1); // Imprimir la fecha en el PDF
$pdf->SetFont('Arial', 'B', 11);

$pdf->Text(120,51,utf8_decode('Cotización N° CP'));


$pdf->SetMargins(10, 10, 10);
$pdf->SetTitle("Cotizaciones");
$pdf->SetFont('Arial', 'B', 12);
$id = $_GET['v'];
$idcliente = $_GET['cl'];
$coti = mysqli_query($conexion, "SELECT * FROM ventas WHERE id_cliente = '$idcliente' ");
$dato_cot = mysqli_fetch_assoc($coti);
$cotireferencia = mysqli_query($conexion, "SELECT * FROM ventas WHERE id = '$id' ");
$dato_refere = mysqli_fetch_assoc($cotireferencia);
$config = mysqli_query($conexion, "SELECT * FROM configuracion");
$datos = mysqli_fetch_assoc($config);
$clientes = mysqli_query($conexion, "SELECT * FROM cliente WHERE idcliente = $idcliente");

$datosC = mysqli_fetch_assoc($clientes);
$ventas = mysqli_query($conexion, "SELECT d.*, p.codproducto, p.descripcion FROM detalle_venta d INNER JOIN producto p ON d.id_producto = p.codproducto WHERE d.id_venta = $id");
$pdf->Text(152,51,utf8_decode($id));
$pdf->Text(162,51,utf8_decode('- 210225LO'));
$pdf->Text(162,55,utf8_decode('Exp. C0955'));
$pdf->Image("../../assets/img/logo-connections.png", 150, 10, -250);
$pdf->SetFont('Arial', 'B', 10);
$pdf->Cell(10, 5, utf8_decode("Sres. " . $datosC['nombre']), 0, 0, 'L');
$pdf->Ln();
$pdf->Cell(10, 5, utf8_decode("RUC : " . $datosC['ruc']), 0, 0, 'L');
$pdf->Ln();
$pdf->Cell(10, 5, utf8_decode("Dirección : " . $datosC['direccion']), 0, 0, 'L');
$pdf->Ln();
$pdf->Cell(10, 5, utf8_decode("Atención : " . $datosC['nombre']), 0, 0, 'L');
$pdf->Ln();
$pdf->Cell(10, 5, utf8_decode("Cel : " . $datosC['telefono']), 0, 0, 'L');
$pdf->Ln();
$pdf->Cell(10, 5, utf8_decode("Correo : " . $datosC['correo']), 0, 0, 'L');
$pdf->Ln();
$pdf->SetX(40);
$pdf->Cell(10, 5, utf8_decode("Referencia : " . $dato_refere['referencia']), 0, 0, 'L');






$pdf->Ln();
$pdf->Ln();
$pdf->Ln();
$pdf->SetFont('Arial', '', 10);
$pdf->SetFillColor(0, 0, 0);
$pdf->SetTextColor(255, 255, 255);
$pdf->Cell(196, 5, "Datos del cliente", 1, 1, 'C', 1);
$pdf->SetTextColor(0, 0, 0);
$pdf->Cell(90, 5, utf8_decode('Nombre'), 0, 0, 'L');
$pdf->Cell(50, 5, utf8_decode('Teléfono'), 0, 0, 'L');
$pdf->Cell(56, 5, utf8_decode('Dirección'), 0, 1, 'L');
$pdf->SetFont('Arial', '', 10);
$pdf->Cell(90, 5, utf8_decode($datosC['nombre']), 0, 0, 'L');
$pdf->Cell(50, 5, utf8_decode($datosC['telefono']), 0, 0, 'L');
$pdf->Cell(56, 5, utf8_decode($datosC['direccion']), 0, 1, 'L');
$pdf->Ln(3);
$pdf->SetFont('Arial', 'B', 10);
$pdf->SetTextColor(255, 255, 255);
$pdf->Cell(196, 5, "Detalle de Producto", 1, 1, 'C', 1);
$pdf->SetTextColor(0, 0, 0);
$pdf->Cell(14, 5, utf8_decode('N°'), 0, 0, 'L');
$pdf->Cell(90, 5, utf8_decode('Descripción'), 0, 0, 'L');
$pdf->Cell(25, 5, 'Cantidad', 0, 0, 'L');
$pdf->Cell(32, 5, 'Precio', 0, 0, 'L');
$pdf->Cell(35, 5, 'Sub Total.', 0, 1, 'L');
$pdf->SetFont('Arial', '', 10);
$contador = 1;
while ($row = mysqli_fetch_assoc($ventas)) {
    $pdf->Cell(14, 5, $contador, 0, 0, 'L');
    $pdf->Cell(90, 5, $row['descripcion'], 0, 0, 'L');
    $pdf->Cell(25, 5, $row['cantidad'], 0, 0, 'L');
    $pdf->Cell(32, 5, $row['precio'], 0, 0, 'L');
    $pdf->Cell(35, 5, number_format($row['cantidad'] * $row['precio'], 2, '.', ','), 0, 1, 'L');
    $contador++;
}


// Agregamos la segunda página
$pdf->AddPage();
$pdf->Image("../../assets/img/logo-connections.png", 170, 10, -300);
// Establecemos la posición y el tamaño de la imagen en la segunda página
$pdf->SetXY(10, 10); // Cambia las coordenadas X e Y según la posición deseada
 // Cambia 'ruta_de_la_imagen_segunda_pagina.jpg' por la ruta de tu imagen

// Agregamos la segunda página
$pdf->AddPage();

// Establecemos la posición y el tamaño de la imagen en la segunda página
$pdf->SetXY(10, 10); // Cambia las coordenadas X e Y según la posición deseada
$pdf->Image('../../assets/img/calibracion3.jpg', 10, 10, 200); // Cambia 'ruta_de_la_imagen_segunda_pagina.jpg' por la ruta de tu imagen


$pdf->AddPage();
$pdf->SetMargins(10, 10, 90);
$pdf->Cell(20, 10, 'ITEM', 1, 0, 'C'); // 20 es el ancho de la celda, 10 es la altura
$pdf->Cell(40, 10, 'NOMBRE DEL MATERIAL', 1, 0, 'C');
$pdf->Cell(20, 10, 'UNIDAD', 1, 0, 'C');
$pdf->Cell(20, 10, 'CANTIDAD', 1, 0, 'C');
$pdf->Cell(50, 10, 'CARACTERISTICAS TECNICAS', 1, 0, 'C');

$posicionX = $pdf->GetX(); // Guardar la posición X actual
$posicionY = $pdf->GetY(); // Guardar la posición Y actual

$pdf->MultiCell(20, 5, 'PRECIO UNITARIO', 1, 'C');

// Establecer la posición Y para la siguiente celda a la posición Y guardada previamente
$pdf->SetXY($posicionX + 20, $posicionY); 

$pdf->MultiCell(20, 5, 'PRECIO PARCIAL', 1, 'C');

// Ejemplo de datos para una fila
$datos = [
    'item' => '1',
    'nombre_material' => 'Material de ejemplo',
    'unidad' => 'kg',
    'cantidad' => '10',
    'caracteristicas_tecnicas' => 'Especificaciones del material',
    'precio_unitario' => '$10',
    'precio_parcial' => '$100'
];

$pdf->SetFont('Arial', '', 10); // Volver a la fuente normal

// Llenar los datos en una fila
$pdf->Cell(20, 10, $datos['item'], 1, 0, 'C');
$pdf->Cell(40, 10, $datos['nombre_material'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['unidad'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['cantidad'], 1, 0, 'C');
$pdf->Cell(50, 10, $datos['caracteristicas_tecnicas'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['precio_unitario'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['precio_parcial'], 1, 1, 'C');

// Llenar los datos en una fila
$pdf->Cell(20, 10, $datos['item'], 1, 0, 'C');
$pdf->Cell(40, 10, $datos['nombre_material'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['unidad'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['cantidad'], 1, 0, 'C');
$pdf->Cell(50, 10, $datos['caracteristicas_tecnicas'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['precio_unitario'], 1, 0, 'C');
$pdf->Cell(20, 10, $datos['precio_parcial'], 1, 1, 'C');




$pdf->AddPage();



$consulta = mysqli_query($conexion, "SELECT p.descripcion AS nombre_producto, p.caracteristicas ,dv.cantidad, dv.precio FROM detalle_venta dv INNER JOIN producto p ON dv.id_producto = p.codproducto WHERE dv.id_venta = 2342;");
$pdf->SetMargins(10, 10, 90);
$pdf->Cell(20, 10, 'ITEM', 1, 0, 'C'); // 20 es el ancho de la celda, 10 es la altura
$pdf->Cell(40, 10, 'NOMBRE DEL MATERIAL', 1, 0, 'C');
$pdf->Cell(20, 10, 'UNIDAD', 1, 0, 'C');
$pdf->Cell(20, 10, 'CANTIDAD', 1, 0, 'C');
$pdf->Cell(50, 10, 'CARACTERISTICAS TECNICAS', 1, 0, 'C');

$posicionX = $pdf->GetX(); // Guardar la posición X actual
$posicionY = $pdf->GetY(); // Guardar la posición Y actual

$pdf->MultiCell(20, 5, 'PRECIO UNITARIO', 1, 'C');

// Establecer la posición Y para la siguiente celda a la posición Y guardada previamente
$pdf->SetXY($posicionX + 20, $posicionY); 

$pdf->MultiCell(20, 5, 'PRECIO PARCIAL', 1, 'C');
while($row = mysqli_fetch_assoc($consulta)){
    $pdf->MultiCell(90,10,utf8_decode($row['nombre_producto']),1,'C',0);
    $pdf->MultiCell(90,10,utf8_decode($row['caracteristicas']),1,'C',0);
    $pdf->MultiCell(90,10,utf8_decode($row['cantidad']),1,'C',0);
}

$pdf->Output("ventas.pdf", "I");

?>
