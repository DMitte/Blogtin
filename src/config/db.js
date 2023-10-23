const dbName = 'BlogDB';
const dbVersion = 1;

const request = indexedDB.open(dbName, dbVersion);

request.onupgradeneeded = (event) => {
    const db = event.target.result;
    if (!db.objectStoreNames.contains('miObjeto')) {
      db.createObjectStore('miObjeto', { keyPath: 'id', autoIncrement: true });
    }
  };

export default request;