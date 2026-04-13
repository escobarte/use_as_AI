# Figma MCP Go — Гайд по установке

Пошаговая инструкция по настройке figma-mcp-go для управления Figma через Claude Code.

---

## Что это

Open-source MCP-сервер для Figma. Работает через плагин (не через Figma REST API) — без токенов и лимитов на запросы.

---

## Требования

- Node.js + npm (`node -v` и `npm -v` должны работать)
- Figma Desktop (не браузер)
- Claude Code CLI

---

## Шаг 1 — Скачай репозиторий

Скачай и распакуй архив с GitHub:
[https://github.com/vkhanhqui/figma-mcp-go/releases](https://github.com/vkhanhqui/figma-mcp-go/releases)

---

## Шаг 2 — Собери плагин

Плагин нужно собрать вручную — папки `dist/` в архиве нет.

```bash
cd /путь/к/figma-mcp-go/plugin
npm install
npm run build
```

После сборки появится папка `plugin/dist/` с файлами `code.js` и `index.html`.

---

## Шаг 3 — Установи плагин в Figma Desktop

1. Открой **Figma Desktop**
2. **Plugins → Development → Import plugin from manifest**
3. Выбери файл `manifest.json` по пути:
   ```
   /путь/к/figma-mcp-go/plugin/manifest.json
   ```
4. Открой любой Figma-файл
5. **Plugins → Development → Figma MCP Go** — запусти плагин и оставь окно открытым

---

## Шаг 4 — Настрой MCP в Claude Code

### Вариант A: Глобально (рекомендуется)

Добавь сервер глобально через Node.js (напрямую редактировать `~/.claude.json`).
Это позволит запускать `claude` из **любой папки** и figma-mcp-go будет доступен.

```bash
node -e "
const fs = require('fs');
const path = require('os').homedir() + '/.claude.json';
const d = JSON.parse(fs.readFileSync(path, 'utf8'));
d.mcpServers = d.mcpServers || {};
d.mcpServers['figma-mcp-go'] = {
  type: 'stdio',
  command: 'npx',
  args: ['-y', '@vkhanhqui/figma-mcp-go@latest']
};
fs.writeFileSync(path, JSON.stringify(d, null, 2));
console.log('Done');
"
```

### Вариант B: Только для конкретного проекта

Создай `.mcp.json` в корне нужного проекта:

```json
{
  "mcpServers": {
    "figma-mcp-go": {
      "type": "stdio",
      "command": "npx",
      "args": [
        "-y",
        "@vkhanhqui/figma-mcp-go@latest"
      ],
      "env": {}
    }
  }
}
```

При этом варианте `claude` нужно запускать **из той папки**, где лежит `.mcp.json`.

> **Важно:** не используй `claude mcp add` с `@` в аргументе напрямую в bash —
> bash интерпретирует `@vkhanhqui/...` как отдельную команду и сохранит неполную конфигурацию.
> Редактируй конфиг вручную одним из способов выше.

---

## Шаг 5 — Проверь подключение

```bash
claude mcp list
```

Ожидаемый результат:
```
figma-mcp-go: npx -y @vkhanhqui/figma-mcp-go@latest - ✓ Connected
```

---

## Шаг 6 — Работа с Claude Code

```bash
claude
```

Плагин в Figma должен быть **открыт и запущен** во время работы — он служит мостом между Claude и Figma.

Примеры команд:
- "Создай фрейм 400x300 с синим фоном"
- "Получи список всех страниц в текущем файле"
- "Переименуй слой Header в Nav"

---

## Частые ошибки

| Ошибка | Причина | Решение |
|--------|---------|---------|
| `Manifest error: containsWidget` | Импортируешь как виджет | Используй **Plugins → Development**, не виджеты |
| `figma-mcp-go: npx -y - ✗ Failed to connect` | В конфиге не хватает имени пакета | Отредактируй `.mcp.json` вручную, добавь `@vkhanhqui/figma-mcp-go@latest` в args |
| `dist/` не найден | Плагин не собран | Выполни `npm install && npm run build` в папке `plugin/` |
| figma-mcp-go не появляется в `/context` | Claude запущен не из папки с `.mcp.json` | Используй глобальную установку (Вариант A) или запускай `claude` из нужной папки |
