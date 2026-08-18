# Browser Route Reference

## Quick matrix

| Route | Existing normal tab | Existing login | Safari engine | Visible OS cursor | Best use |
|---|---:|---:|---:|---:|---|
| Codex Chrome control | Yes | Yes | No | Runtime-dependent | Interactive browsing in current Chrome |
| Computer Use | Yes, Chrome or Safari | Yes | Yes | Desktop UI control; visibility varies | Exact-tab takeover and visual UI |
| Playwright Extension | Yes, Chrome/Edge | Yes | No | No OS-cursor guarantee | Attach to an authenticated Chrome tab |
| Playwright persistent profile | Separate tab/window | Dedicated login | WebKit available, not normal Safari | No OS-cursor guarantee | Scheduled and repeatable publication |
| Selenium Safari | No; isolated automation window | Separate clean session | Yes, actual Safari | No OS-cursor guarantee | Safari-specific repeatable testing |

## Playwright attachment

Official Playwright CLI attachment modes:

```text
playwright-cli attach --extension
playwright-cli attach --cdp=chrome
playwright-cli attach --cdp=http://localhost:9222
```

Extension mode is the preferred exact-tab route because it is designed to reuse existing Chrome/Edge tabs, cookies, sessions, and extensions. It requires the official Playwright Extension to be installed and connected.

CDP attachment requires Chrome remote debugging. Current Chrome requires a non-default user-data directory for remote-debugging switches, so do not redesign the user's ordinary Chrome profile around CDP. CDP is lower fidelity than the native Playwright protocol and target selection must still be verified.

References:

- https://playwright.dev/agent-cli/commands/attach
- https://playwright.dev/mcp/configuration/browser-extension
- https://developer.chrome.com/blog/remote-debugging-port

## Safari WebDriver facts

Safari WebDriver creates special automation windows isolated from normal browsing windows, settings, history, AutoFill, and other normal-session information. It allows one Safari/WebDriver automation session at a time and does not provide a supported way to attach to an arbitrary existing Safari tab.

Enable it once through Safari's Developer settings or:

```text
safaridriver --enable
```

After installing Selenium into a dedicated environment, test the isolated Safari route with `scripts/safari-selenium-smoke.py`. The test opens an automation window, clicks a local in-memory button, verifies the result, and closes Safari WebDriver without visiting an external site.

Do not assume it runs after logout, screen lock, Fast User Switching, or loss of the GUI session. Use it for Safari-engine validation, not as the primary scheduled-posting engine.

References:

- https://developer.apple.com/documentation/safari-developer-tools/webdriver
- https://developer.apple.com/documentation/safari-developer-tools/macos-enabling-webdriver
- https://developer.apple.com/documentation/webkit/testing-with-webdriver-in-safari
- https://www.selenium.dev/documentation/webdriver/browsers/safari/

## Observability

Playwright CLI supports headed mode, a live dashboard, highlighting, tracing, screenshots, video, and action annotations. Its semantic locator model is more reliable than coordinate guessing. Pointer events occur within the browser page and do not guarantee movement of the macOS global cursor.

References:

- https://playwright.dev/python/docs/getting-started-cli
- https://playwright.dev/mcp/introduction
- https://playwright.dev/docs/api/class-screencast
- https://www.selenium.dev/documentation/webdriver/actions_api/mouse/

## Scheduled-publication design

Use a dedicated persistent Playwright profile and a secret-free durable checkpoint. The due-time execution must:

1. restore the intended account/session;
2. verify destination and identity;
3. search for an existing matching publication;
4. populate and preflight content;
5. submit once;
6. capture and validate the live URL;
7. mark the job complete only after validation;
8. notify the user rather than silently waiting if authentication has expired.

Use Computer Use or Playwright Extension attachment only as a recovery path for an already-prepared normal-browser draft.
