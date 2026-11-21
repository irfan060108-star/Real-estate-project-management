$port = 8080
$path = "c:\Users\ELCOT\OneDrive\Desktop\real estate"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
try {
    $listener.Start()
    Write-Output "Server started on http://localhost:$port/"
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        $localPath = $request.Url.LocalPath
        if ($localPath -eq "/" -or [string]::IsNullOrWhiteSpace($localPath)) {
            $localPath = "/index.html"
        }
        $filePath = Join-Path $path ($localPath.TrimStart('/').Replace('/', '\'))
        if (Test-Path $filePath -PathType Leaf) {
            $content = [System.IO.File]::ReadAllBytes($filePath)
            $ext = [System.IO.Path]::GetExtension($filePath).ToLower()
            if ($ext -eq ".html") { $response.ContentType = "text/html; charset=utf-8" }
            elseif ($ext -eq ".js") { $response.ContentType = "application/javascript" }
            elseif ($ext -eq ".css") { $response.ContentType = "text/css" }
            elseif ($ext -eq ".json") { $response.ContentType = "application/json" }
            elseif ($ext -eq ".png") { $response.ContentType = "image/png" }
            elseif ($ext -eq ".jpg" -or $ext -eq ".jpeg") { $response.ContentType = "image/jpeg" }
            elseif ($ext -eq ".svg") { $response.ContentType = "image/svg+xml" }
            else { $response.ContentType = "application/octet-stream" }
            $response.ContentLength64 = $content.Length
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $response.StatusCode = 404
            $buf = [System.Text.Encoding]::UTF8.GetBytes("File Not Found")
            $response.ContentLength64 = $buf.Length
            $response.OutputStream.Write($buf, 0, $buf.Length)
        }
        $response.OutputStream.Close()
    }
} catch {
    Write-Error $_
} finally {
    $listener.Stop()
}
