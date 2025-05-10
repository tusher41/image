import librosa, numpy as np, matplotlib.pyplot as plt
from python_speech_features import mfcc

y, sr = librosa.load("recorded_audio.wav", sr=16000, duration=3)

mf = mfcc(y, sr, numcep=13, nfilt=26, nfft=512)
plp = mf  # Approximation
frame_len = int(0.025 * sr)
hop = int(0.01 * sr)
frames = librosa.util.frame(y, frame_length=frame_len, hop_length=hop).T
lpc = np.array([librosa.lpc(f, order=12) for f in frames])  # ✅ fixed here

print("MFCC:", mf.shape, "PLP:", plp.shape, "LPC:", lpc.shape)

plt.subplot(3,1,1); plt.imshow(mf.T, aspect='auto'); plt.title("MFCC")
plt.subplot(3,1,2); plt.imshow(plp.T, aspect='auto'); plt.title("PLP")
plt.subplot(3,1,3); plt.plot(lpc[:,1:]); plt.title("LPC")
plt.tight_layout(); plt.show()
