// Renders cover.html to a 1080x1350 (4:5) PNG with headless Chromium.
// Usage: node render.mjs [output.png]
import { chromium } from "../../node_modules/playwright/index.mjs";
import { fileURLToPath, pathToFileURL } from "node:url";
import { dirname, join } from "node:path";

const here = dirname(fileURLToPath(import.meta.url));
const out = process.argv[2] ?? join(here, "demiard-cover.png");

const browser = await chromium.launch({ executablePath: "/opt/pw-browsers/chromium" });
const page = await browser.newPage({ viewport: { width: 1080, height: 1350 } });
await page.goto(pathToFileURL(join(here, process.argv[3] ?? "cover.html")).href, { waitUntil: "networkidle" });
await page.evaluate(() => document.fonts.ready);
await page.screenshot({ path: out, clip: { x: 0, y: 0, width: 1080, height: 1350 } });
await browser.close();
console.log("wrote", out);
