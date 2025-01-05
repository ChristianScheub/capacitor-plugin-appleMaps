# apple-maps-sdk

The apple-maps-sdk is a Capacitor plugin that provides access to the native iOS Apple Maps SDK for developers to integrate Apple Maps into their mobile applications. This plugin allows users to utilize the native Apple Maps API to display maps, set markers, and adjust the map’s center point directly within their app. Features such as showing and hiding the map, adding custom data points, and checking if the map is visible are included. It also supports managing the current location and other map settings using native iOS functionality. This plugin is perfect for developers who want to leverage the full capabilities of Apple’s native map features on iOS devices.

## Install

```bash
npm install apple-maps-sdk
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`initAppleMaps()`](#initapplemaps)
* [`showAppleMaps()`](#showapplemaps)
* [`hideAppleMaps()`](#hideapplemaps)
* [`setValuesAppleMaps(...)`](#setvaluesapplemaps)
* [`setCenterPoint(...)`](#setcenterpoint)
* [`closeAppleMaps()`](#closeapplemaps)
* [`isAppleMapsVisible()`](#isapplemapsvisible)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### initAppleMaps()

```typescript
initAppleMaps() => Promise<{ status: string; }>
```

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### showAppleMaps()

```typescript
showAppleMaps() => Promise<{ status: string; }>
```

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### hideAppleMaps()

```typescript
hideAppleMaps() => Promise<{ status: string; }>
```

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### setValuesAppleMaps(...)

```typescript
setValuesAppleMaps(options: { dataPoints: { latitude: number; longitude: number; label: string; }[]; }) => Promise<{ status: string; }>
```

| Param         | Type                                                                                    |
| ------------- | --------------------------------------------------------------------------------------- |
| **`options`** | <code>{ dataPoints: { latitude: number; longitude: number; label: string; }[]; }</code> |

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### setCenterPoint(...)

```typescript
setCenterPoint(options: { latitude: number; longitude: number; }) => Promise<{ status: string; }>
```

| Param         | Type                                                  |
| ------------- | ----------------------------------------------------- |
| **`options`** | <code>{ latitude: number; longitude: number; }</code> |

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### closeAppleMaps()

```typescript
closeAppleMaps() => Promise<{ status: string; }>
```

**Returns:** <code>Promise&lt;{ status: string; }&gt;</code>

--------------------


### isAppleMapsVisible()

```typescript
isAppleMapsVisible() => Promise<{ status: number; }>
```

**Returns:** <code>Promise&lt;{ status: number; }&gt;</code>

--------------------

</docgen-api>
