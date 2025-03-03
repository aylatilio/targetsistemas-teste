function pertence_fibonacci {
    param([int]$numero)
    $a = 0
    $b = 1
    while ($b -lt $numero) {
        $temp = $b
        $b = $a + $b
        $a = $temp
    }
    return ($b -eq $numero -or $numero -eq 0)
}

Write-Host "Digite um numero ou FIM para finalizar o programa."

while ($true) {
    $entrada = Read-Host "Digite um numero"
    
    if ($entrada -eq "FIM") {
        Write-Host "Finalizado!"
        break
    }

    if ($entrada -match '^\d+$') {
        $num = [int]$entrada
        if (pertence_fibonacci $num) {
            Write-Host "O numero $num pertence a sequencia de Fibonacci."
        } else {
            Write-Host "O numero $num NAO pertence a sequencia de Fibonacci."
        }
    } else {
        Write-Host "Por favor, digite um numero valido ou 'FIM' para finalizar o programa."
    }
}