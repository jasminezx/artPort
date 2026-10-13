@echo off
rem ===================================================================
rem  一键推送到 GitHub（jasminezx/artPort）
rem  你在自己终端里运行这个脚本，凭据会走 Windows 凭据管理器，不用手输密码。
rem  GitHub Pages 部署后地址： https://jasminezx.github.io/artPort/
rem ===================================================================
setlocal
cd /d "%~dp0"

rem 这台机器直连 github.com:443 不通，需要走本地代理；如果你换了网络/代理端口，改这里
set HTTPS_PROXY=http://127.0.0.1:7897
set HTTP_PROXY=http://127.0.0.1:7897

echo.
echo == 当前状态 ==
git log --oneline -1
git remote -v

echo.
echo == 推送 main 到 GitHub ==
git push -u origin main
if errorlevel 1 goto fail

echo.
echo 推送成功。接下来在浏览器里开启 Pages：
echo   1. 打开 https://github.com/jasminezx/artPort/settings/pages
echo   2. Source 选 "Deploy from a branch"
echo   3. Branch 选 main ，目录选 / (root) ，点 Save
echo   4. 等 1 分钟左右，访问 https://jasminezx.github.io/artPort/
goto end

:fail
echo.
echo 推送失败。常见原因：
echo   - 代理没开（看 HTTPS_PROXY 那行是不是你当前代理的端口）
echo   - 没有仓库写权限 / 凭据过期：删掉 Windows 凭据管理器里的 git:https://github.com 后重试，会重新弹授权
echo   - 用户名密码方式已停用，必须用「私人访问令牌」或浏览器授权

:end
echo.
pause
endlocal
