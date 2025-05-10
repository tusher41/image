import cv2
import numpy as np
import matplotlib.pyplot as plt

# Load a binary image
img = cv2.imread('E:\image processing 3-2 lab practice\website.jpg', cv2.IMREAD_GRAYSCALE)
_, binary = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)

# Add salt & pepper noise
def add_salt_pepper_noise(image, amount=0.02):
    noisy = image.copy()
    num_salt = np.ceil(amount * image.size * 0.5)
    num_pepper = np.ceil(amount * image.size * 0.5)

    # Salt
    coords = [np.random.randint(0, i - 1, int(num_salt)) for i in image.shape]
    noisy[coords[0], coords[1]] = 255

    # Pepper
    coords = [np.random.randint(0, i - 1, int(num_pepper)) for i in image.shape]
    noisy[coords[0], coords[1]] = 0

    return noisy

noisy_img = add_salt_pepper_noise(binary)

# Create structuring element
kernel = cv2.getStructuringElement(cv2.MORPH_ELLIPSE, (5,5))

# Apply Morphological Operations
eroded = cv2.erode(noisy_img, kernel, iterations=1)
dilated = cv2.dilate(noisy_img, kernel, iterations=1)
opened = cv2.morphologyEx(noisy_img, cv2.MORPH_OPEN, kernel)
closed = cv2.morphologyEx(noisy_img, cv2.MORPH_CLOSE, kernel)

# Display results
titles = ['Original (Noisy)', 'Erosion', 'Dilation', 'Opening', 'Closing']
images = [noisy_img, eroded, dilated, opened, closed]

plt.figure(figsize=(12, 6))
for i in range(5):
    plt.subplot(2, 3, i+1)
    plt.imshow(images[i], cmap='gray')
    plt.title(titles[i])
    plt.axis('off')
plt.tight_layout()
plt.show()
