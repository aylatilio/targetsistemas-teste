function inverter_string {
    param([string]$s)
    $string_invertida = ""
    
    for ($i = $s.Length - 1; $i -ge 0; $i--) {
        $string_invertida += $s[$i]
    }
    
    return $string_invertida
}

Write-Host "Digite uma string para inverter ou FIM para parar."

while ($true) {
    $entrada = Read-Host "Digite uma string"
    
    if ($entrada -eq "FIM") {
        Write-Host "Fim do programa."
        break
    }
    
    $resultado = inverter_string $entrada
    Write-Host "A string invertida eh: $resultado"
}