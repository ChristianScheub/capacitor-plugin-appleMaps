import { registerPlugin } from '@capacitor/core';

import type { appleMapsSdkPlugin } from './definitions';

const appleMapsSdk = registerPlugin<appleMapsSdkPlugin>('appleMapsSdk', {
  web: () => import('./web').then(m => new m.appleMapsSdkWeb()),
});

export * from './definitions';
export { appleMapsSdk };
