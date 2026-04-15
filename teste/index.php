<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Calculadora PHP</title>
</head>
<body>
    <h1>Calculadora Simples</h1>

    <!-- Formulário para enviar dados via POST -->
    <form method="post">
        <input type="number" name="num1" placeholder="Número 1" required>
        <select name="operacao">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select>
        <input type="number" name="num2" placeholder="Número 2" required>
        <button type="submit">Calcular</button>
    </form>

    <?php
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $num1 = $_POST["num1"];
        $num2 = $_POST["num2"];
        $operacao = $_POST["operacao"];
        $resultado = "";

        switch ($operacao) {
            case "+":
                $resultado = $num1 + $num2;
                break;
            case "-":
                $resultado = $num1 - $num2;
                break;
            case "*":
                $resultado = $num1 * $num2;
                break;
            case "/":
                if ($num2 != 0) {
                    $resultado = $num1 / $num2;
                } else {
                    $resultado = "Erro: divisão por zero!";
                }
                break;
        }

        echo "<h2>Resultado: $resultado</h2>";
    }
    ?>
</body>
</html>
