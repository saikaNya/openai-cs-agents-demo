# 开发环境快速启动脚本
# 作者: heyi

Write-Host "========================================" -ForegroundColor Green
Write-Host "启动开发环境 - 作者: heyi" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# 启动后端服务
Write-Host "正在启动后端服务..." -ForegroundColor Yellow
Start-Process -FilePath "powershell" -ArgumentList "-NoExit", "-Command", "cd python-backend; python -m uvicorn api:app --reload --port 8001" -WindowStyle Normal

# 等待2秒
Start-Sleep -Seconds 2

# 启动前端服务
Write-Host "正在启动前端服务..." -ForegroundColor Yellow
Start-Process -FilePath "powershell" -ArgumentList "-NoExit", "-Command", "cd ui; pnpm run dev" -WindowStyle Normal

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "开发环境启动完成！" -ForegroundColor Green
Write-Host "后端服务: http://localhost:8001" -ForegroundColor Cyan
Write-Host "前端服务: http://localhost:3000 (通常)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "按任意键退出..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 