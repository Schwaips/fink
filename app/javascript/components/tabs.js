
const initTabs = () => {
  const tabs = document.querySelectorAll('.tab-underlined')
  if (tabs) {
    tabs.forEach((tab) => {
      tab.addEventListener('click', (event) => {
        console.log('Hello')
        const activeTabs = document.querySelectorAll('.active')
        activeTabs.forEach((activeTab) => {
          console.log('Hello2');
          activeTab.classList.remove('active');
        });
      });
    });
  }
}

export { initTabs };
