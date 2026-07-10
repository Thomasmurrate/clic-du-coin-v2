Write-Host ""
Write-Host "=============================="
Write-Host " CLIC DU COIN V2 - CONTROL"
Write-Host "=============================="
Write-Host ""

function Test-Cmd($name) {
  $cmd = Get-Command $name -ErrorAction SilentlyContinue
  if ($cmd) {
    Write-Host "OK  $name -> $($cmd.Source)"
  } else {
    Write-Host "NO  $name introuvable"
  }
}

function Test-File($path) {
  if (Test-Path $path) {
    Write-Host "OK  $path"
  } else {
    Write-Host "NO  $path"
  }
}

Write-Host "---- COMMANDES ----"
Test-Cmd "node"
Test-Cmd "npm"
Test-Cmd "git"
Test-Cmd "claude"
Test-Cmd "codex"
Test-Cmd "vercel"
Write-Host ""

Write-Host "---- VERSIONS ----"
try { node -v } catch {}
try { npm -v } catch {}
try { git --version } catch {}
try { claude --version } catch {}
try { codex --version } catch {}
Write-Host ""

Write-Host "---- PROJET ----"
Test-File "package.json"
Test-File "AGENTS.md"
Test-File "CLAUDE.md"
Test-File "design-system\MASTER.md"
Test-File ".claude\skills\ui-ux-pro-max\SKILL.md"
Test-File ".claude\skills\clic-site-director\SKILL.md"
Test-File ".claude\skills\local-business-copywriter\SKILL.md"
Test-File ".claude\skills\visual-site-review\SKILL.md"
Test-File ".claude\skills\tool-scout\SKILL.md"
Write-Host ""

Write-Host "---- SUPABASE ----"
Test-File "supabase\config.toml"
Test-File "src\lib\supabase.ts"
if (Test-Path "supabase\migrations") {
  $migrations = Get-ChildItem "supabase\migrations" -Filter "*.sql" -ErrorAction SilentlyContinue
  Write-Host "OK  migrations Supabase: $($migrations.Count)"
} else {
  Write-Host "NO  dossier supabase\migrations absent"
}

if (Test-Path ".env.local") {
  $envLocal = Get-Content ".env.local"
  if ($envLocal -match "NEXT_PUBLIC_SUPABASE_URL=.+") {
    Write-Host "OK  NEXT_PUBLIC_SUPABASE_URL present"
  } else {
    Write-Host "NO  NEXT_PUBLIC_SUPABASE_URL vide"
  }

  if ($envLocal -match "NEXT_PUBLIC_SUPABASE_ANON_KEY=.+") {
    Write-Host "OK  NEXT_PUBLIC_SUPABASE_ANON_KEY present"
  } else {
    Write-Host "NO  NEXT_PUBLIC_SUPABASE_ANON_KEY vide"
  }
} else {
  Write-Host "NO  .env.local absent"
}
Write-Host ""

Write-Host "---- GIT ----"
git status --short
git remote -v
Write-Host ""

Write-Host "---- CLAUDE MCP ----"
try {
  claude mcp list
} catch {
  Write-Host "NO  impossible de lire Claude MCP"
}
Write-Host ""

Write-Host "---- PACKAGE SCRIPTS ----"
try {
  $pkg = Get-Content "package.json" -Raw | ConvertFrom-Json
  $pkg.scripts.PSObject.Properties | ForEach-Object {
    Write-Host "OK  npm run $($_.Name) -> $($_.Value)"
  }
} catch {
  Write-Host "NO  impossible de lire package.json"
}
Write-Host ""

Write-Host "---- TEST BUILD RAPIDE ----"
Write-Host "Commande conseillee : npm run build"
Write-Host ""

Write-Host "=============================="
Write-Host " FIN DU CONTROLE"
Write-Host "=============================="