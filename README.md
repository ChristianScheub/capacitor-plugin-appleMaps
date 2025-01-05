# apple-maps-sdk

dd

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
