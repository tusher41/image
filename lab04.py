import librosa, crepe, numpy as np, matplotlib.pyplot as plt

y, sr = librosa.load(r"D:\3-2 all document\tushar3-2\digital image and speech prossesing\speech\lab\recorded_audio.wav", sr=16000, duration=5)
y = librosa.util.normalize(y).astype(np.float32)

yin = librosa.yin(y, fmin=80, fmax=400, sr=sr)
pyin, _, _ = librosa.pyin(y, fmin=80, fmax=400, sr=sr)
time, crepe_f0, conf, _ = crepe.predict(np.expand_dims(y, axis=0), sr, viterbi=True)
crepe_f0[conf < 0.5] = np.nan

t = librosa.times_like(yin, sr=sr)

plt.figure(figsize=(10, 5))
plt.plot(t, yin, label="YIN")
plt.plot(t, pyin, label="PYIN")
plt.plot(time, crepe_f0, label="CREPE")
plt.title("Pitch Estimation")
plt.xlabel("Time (s)")
plt.ylabel("Frequency (Hz)")
plt.legend(), plt.grid(), plt.tight_layout()
plt.show()
