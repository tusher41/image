import os
import numpy as np
import librosa
from sklearn.metrics.pairwise import cosine_similarity

# MFCC extraction
def get_mfcc(file):
    y, sr = librosa.load(file, sr=16000)
    mfcc = librosa.feature.mfcc(y=y, sr=sr, n_mfcc=13)
    return np.mean(mfcc, axis=1)

# Folder path (use raw string)
folder = r"D:\3-2 all document\tushar3-2\digital image and speech prossesing\speech\lab\audio"

# Load reference MFCCs
refs = {
    f.split('.')[0]: get_mfcc(os.path.join(folder, f))
    for f in os.listdir(folder)
    if f.endswith('.wav')
}

# Load test MFCC
test = get_mfcc(r"D:\3-2 all document\tushar3-2\digital image and speech prossesing\speech\lab\recorded_audio.wav")

# Compute and identify best match
scores = {spk: cosine_similarity([test], [vec])[0, 0] for spk, vec in refs.items()}
best = max(scores, key=scores.get)

# Output scores and best match
for speaker, score in scores.items():
    print(f"{speaker}: {score:.4f}")
print(f"Identified Speaker: {best}")
