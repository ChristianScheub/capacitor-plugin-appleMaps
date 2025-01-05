import { WebPlugin } from '@capacitor/core';

import type { appleMapsSdkPlugin } from './definitions';

export class appleMapsSdkWeb extends WebPlugin implements appleMapsSdkPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
