// Function to get the user's system color scheme preference
function getSystemThemePreference() {
  return window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
}

// Function to get the current theme (saved or system preference)
function getCurrentTheme() {
  return localStorage.getItem('theme') || getSystemThemePreference();
}

// Apply the current theme
function applyTheme(theme) {
  document.documentElement.setAttribute('data-theme', theme);
  // updateButtonText(theme);
}

// Function to toggle the theme
function toggleTheme() {
  const currentTheme = getCurrentTheme();
  const newTheme = (currentTheme === 'light') ? 'dark' : 'light';
  localStorage.setItem('theme', newTheme);
  applyTheme(newTheme);
}

// Function to update button text
// function updateButtonText(theme) {
//   const button = document.getElementById('theme-toggle');
//   if (button) {
//     button.textContent = (theme === 'light') ? 'Dark Mode' : 'Light Mode';
//   }
// }

// Initialize theme
document.addEventListener('DOMContentLoaded', () => {
  const initialTheme = getCurrentTheme();
  applyTheme(initialTheme);

  // Add click event listener to the theme toggle button
  const themeToggle = document.getElementById('theme-toggle');
  if (themeToggle) {
    themeToggle.addEventListener('click', toggleTheme);
  }

  document.documentElement.classList.add('theme-transition-ready');
});

// Listen for changes in system color scheme
window.matchMedia('(prefers-color-scheme: dark)').addListener((e) => {
  if (!localStorage.getItem('theme')) {
    const newTheme = e.matches ? 'dark' : 'light';
    applyTheme(newTheme);
  }
});
