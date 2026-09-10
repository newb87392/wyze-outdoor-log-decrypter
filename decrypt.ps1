$f = ".\s_log.txt"

$b = [IO.File]::ReadAllBytes((Resolve-Path $f))

$decoded = New-Object byte[] $b.Length

for ($i = 0; $i -lt $b.Length; $i++) {
    $decoded[$i] = $b[$i] -bxor 0x09
}

$out = [IO.Path]::ChangeExtension((Resolve-Path $f).Path, ".decoded.txt")

[IO.File]::WriteAllBytes($out, $decoded)

Write-Host "Decoded to:"
Write-Host $out
