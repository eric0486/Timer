# Discord Countdown Timer

A browser-based countdown timer with spoken audio, designed for use in Discord voice channels via VB-Audio Virtual Cable. Includes three timer modes: Standard Countdown, KvK Reinforcement Timer, and Flamedragon Tyrant.

---

## Files

| File | Description |
|------|-------------|
| `index.html` | **Recommended.** Full-featured browser app — no install needed. |
| `countdown_timer.py` | Optional Python desktop app version. |
| `run.bat` | Launches the Python version (Windows). |
| `requirements.txt` | Python dependency list. |

---

## Quick Start (HTML version)

1. Open `index.html` in **Edge** or **Firefox**.
2. Select your **Language** (see [Languages](#languages)).
3. Choose a **Timer Mode** (see [Timer Modes](#timer-modes)).
4. Adjust **Volume**, **Speech Rate**, and other settings.
5. Choose a **Voice** (Cloud or Local — see [Voice Options](#voice-options)).
6. Click **TEST VOICE** to verify audio.
7. Click **START**.

---

## Languages

Select the interface and speech language from the radio buttons at the top:

| Option | Language |
|--------|----------|
| English | English |
| 中文 | Chinese (Simplified) |
| Français | French |
| العربية | Arabic |
| 한국어 | Korean |
| Español | Spanish |
| Deutsch | German |
| Українська | Ukrainian |

Changing the language updates all UI labels and switches the spoken countdown voice to the matching language (in both Cloud and Local modes).

---

## Timer Modes

### 1. Standard Countdown

A straightforward countdown timer that speaks the remaining time aloud.

**How to use:**
1. Set **Duration** in minutes and seconds (or click a Quick Set chip: 30s, 1m, 5m, 10m).
2. Configure announcement frequency and final countdown window (see [Shared Settings](#shared-settings)).
3. Click **START**.

**What happens:**
- The timer counts down and announces each interval.
- In the final seconds (based on the "Always count last" setting), every second is announced.
- Optionally, the screen flashes red when time is nearly up.
- "Time's up!" (or equivalent in selected language) is spoken at zero.

---

### 2. KvK Reinforcement Timer

Tracks multiple enemy rallies and automatically counts down to your send time so your reinforcements land at the right moment.

**How to use:**
1. Select **KvK Reinforcement Timer** from the Timer Mode options.
2. Enter **My march time** — how long your troops take to reach the target (minutes + seconds).
3. Click **+ Add Rally** for each enemy rally and fill in:
   - **Enemy march** — how long the enemy's march takes to land (minutes + seconds).
   - **Rally left** — how much time is left on the enemy's rally timer (minutes + seconds).
   - **Player** *(optional)* — a name label for this rally.
4. Click **Start Timer** on the rally you want to begin tracking (or click it to add it to the queue).
5. Click **START** to start the countdown.

**What happens:**
- The app calculates when each rally lands (enemy march time + rally time left).
- It selects the rally that lands **soonest** and counts down to when **you** must send your troops.
- The queue display updates live, showing remaining send time and landing time for every rally.
- An audible **10-second warning** is spoken before your send time.
- **"Send your march now!"** is spoken at send time.
- If multiple rallies are queued, secondary 10-second and send-now alerts are spoken for each.
- Click **Clear Queue** to remove all rally entries.

---

### 3. Flamedragon Tyrant

Counts down to the exact moment you need to send your troops to land just after an enemy Flamedragon Tyrant rally, with an optional landing offset.

**How to use:**

**Step 1 — Choose Target Landing Input method:**

- **UTC Time** — enter the exact UTC clock time when the target rally lands:
  - Fill in **Target Rally Lands At (UTC)** — hours, minutes, seconds.

- **Countdown** — enter timing values directly from the game screen:
  - **Target rally time left** — how much time remains on the target rally timer (minutes + seconds).
  - **Target enemy march time** — how long the target enemy's troops take to march (minutes + seconds).

**Step 2 — Enter your march time:**
- **My march time to target** — how long your troops take to reach the target (minutes + seconds).

**Step 3 — Set landing offset:**
- **Landing Offset After Target** — a slider from −120s to +120s (default: +5s). Positive values make your troops land slightly *after* the target rally; negative values make them land *before*.

**Step 4 — Review the live preview:**
- The preview shows:
  - *Target rally lands in* — time until the target rally lands.
  - *Your troops land in* — time until your troops arrive (target + offset).
  - *Send troops in* — time until you need to send (= your land time − your march time).
  - *Send at (UTC)* — the UTC clock time you should press send.

**Step 5 — Start:**
- Click **START**. The timer counts down to your send time and speaks **"Send your march now!"** at zero.

---

## Shared Settings

These settings apply to all timer modes:

| Setting | Description |
|---------|-------------|
| **Volume** | Slider from 0–100%. Controls TTS audio volume. |
| **Speech Rate** | Slider from 0.5× to 2.0×. Controls how fast numbers are spoken. |
| **Announce every** | How often the countdown is spoken during the main countdown: 1s, 2s, 5s, 10s, or 30s. Default: 2s. |
| **Always count last** | The final N seconds are always announced every second regardless of the announce interval: 5s, 10s, 30s, or 60s. Default: 10s. |
| **Flash screen at last** | The screen flashes red for the final N seconds (0–90). Set to 0 to disable. |

---

## Voice Options

| Option | Description |
|--------|-------------|
| **Google TTS Voice (Cloud)** | Uses Google Text-to-Speech via the internet. Consistent quality. Requires an internet connection. |
| **Local Microsoft/System Voice** | Uses voices installed on your PC via the browser's built-in speech API. Works offline. A dropdown appears to select among available voices. |

> **Tip:** Click **TEST VOICE** before starting to confirm audio is working. If you hear nothing, check the [Troubleshooting](#troubleshooting) section.

---

## Python Version (Optional)

Use this if you prefer a standalone desktop app instead of the browser.

**Install:**
1. Install [Python 3](https://www.python.org/downloads/).
2. Open a terminal in this folder.
3. Run:
   ```
   pip install -r requirements.txt
   ```

**Start:**
- Double-click `run.bat`, **or**
- Run: `python countdown_timer.py`

The Python version provides a basic Standard Countdown with spoken numbers via Windows text-to-speech (`pyttsx3`).

---

## Using the Timer in Discord

To route the spoken countdown audio into a Discord voice channel:

1. **Download and install VB-Cable (free):**
   [https://vb-audio.com/Cable/](https://vb-audio.com/Cable/)

2. **In Windows Sound settings:**
   - Set the default **Playback** device to:
     `CABLE Input (VB-Audio Virtual Cable)`

3. **In Discord:**
   Settings → Voice & Video → **Input Device:**
   `CABLE Output (VB-Audio Virtual Cable)`

4. Join a voice channel and start the timer. Everyone in the channel will hear the spoken countdown.

---

## Troubleshooting

**No sound in browser:**
- Click **TEST VOICE** first to unblock audio.
- Make sure the Volume slider is above 0.
- Check Windows Volume Mixer for the browser.
- Allow autoplay/audio for the site or tab if blocked by the browser.

**Cloud voice not speaking:**
- Confirm an internet connection is available.
- Switch to **Local Microsoft/System Voice** mode as a fallback.

**No local voices found:**
- Install additional TTS voices via Windows Settings → Time & Language → Speech → Add voices.
- Try a different browser (Edge has the best built-in voice support on Windows).

**Local voice unavailable on mobile:**
- Local voice mode is not supported in most mobile browsers. Use **Cloud** mode or switch to a desktop browser.

**Discord cannot hear the timer:**
- Recheck VB-Cable routing: Windows Playback device → CABLE Input, Discord Input device → CABLE Output.
- Confirm Discord input sensitivity is not cutting off audio (disable automatic input sensitivity if needed).
