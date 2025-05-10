import librosa
import crepe
import numpy as np
import matplotlib.pyplot as plt
# Load the audio file (5 seconds, 16kHz)
audio_file = r"D:\3-2 all document\tushar3-2\digital image and speech prossesing\speech\lab\recorded_audio.wav"
y, sr = librosa.load(audio_file, sr=16000, duration=5)
y = librosa.util.normalize(y).astype(np.float32) # Normalize for crepe
f0_yin = librosa.yin(y, fmin=80, fmax=400, sr=sr)
f0_pyin, _, _ = librosa.pyin(y, fmin=80, fmax=400, sr=sr)
time_crepe, f0_crepe, confidence, _ = crepe.predict(y, sr, viterbi=True)
f0_crepe[confidence < 0.5] = np.nan # Remove low-confidence
# Time axis
time_yin = librosa.times_like(f0_yin, sr=sr)
# Plot all pitches
plt.figure(figsize=(12, 6))
plt.plot(time_yin, f0_yin, label='YIN', alpha=0.7)
plt.plot(time_yin, f0_pyin, label='PYIN', alpha=0.7)
plt.plot(time_crepe, f0_crepe, label='CREPE', alpha=0.7)
plt.title("Pitch Tracking")
plt.xlabel("Time (s)")
plt.ylabel("Frequency (Hz)")
plt.legend()
plt.grid()
plt.tight_layout()
plt.show()