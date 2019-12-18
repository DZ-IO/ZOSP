@mkdir %2
@FOR /F "tokens=3" %%i IN (%1) DO @if not %%i.==%3. move %%i.* .\%2\