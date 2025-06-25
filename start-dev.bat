@echo off
echo ========================================
echo 启动开发环境 - 作者: heyi
echo ========================================
echo.

echo 正在启动后端服务...
start "Python Backend" cmd /k "cd python-backend && python -m uvicorn api:app --reload --port 8001"

echo 等待2秒后启动前端服务...
timeout /t 2 /nobreak >nul

echo 正在启动前端服务...
start "Node Frontend" cmd /k "cd ui && pnpm run dev"

echo.
echo ========================================
echo 开发环境启动完成！
echo 后端服务: http://localhost:8001
echo 前端服务: http://localhost:3000 (通常)
echo ========================================
echo.
echo 按任意键退出...
pause >nul 