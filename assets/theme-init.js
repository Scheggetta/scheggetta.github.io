(function() {
  function getInitialTheme() {
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
      return savedTheme;
    }
    return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
  }

  const initialTheme = getInitialTheme();
  document.documentElement.setAttribute('data-theme', initialTheme);
})();
