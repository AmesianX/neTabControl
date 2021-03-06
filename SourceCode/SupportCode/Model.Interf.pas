/// <exclude />
/// <summary>
///   This unit defines the interfaces for the Provider-Subscriber model
/// </summary>
unit Model.Interf;

interface

uses
  Model.IntActions;

type
  {$REGION 'This interface is used to pass information between the provider and the subscriber.'}
  /// <summary>
  ///   This interface is used to pass information between the provider and the
  ///   subscriber.
  /// </summary>
  {$ENDREGION}
  INotification = interface
    ['{433A448E-9943-40AE-BECB-B8FF653C9CC0}']
  end;

  /// <summary>
  ///   This type is used to pass the correct UpdateSubscriber method to the
  ///   Subscriber interface.
  /// </summary>
  TUpdateSubscriberMethod = procedure (const action: TIntActions) of object;
  TUpdateSubscriberInterfaceMethod = procedure (const notificationClass: INotification) of object;

  /// <summary>
  ///   This interface is used by the Subscribers
  /// </summary>
  ISubscriber = interface
    ['{955BF992-F4FA-4141-9C0F-04600C582C00}']
    /// <summary>
    ///   This method is assigned the UpdateSubscriber methods from the class
    ///   of each subscriber.
    /// </summary>
    /// <param name="newMethod">
    ///   <see cref="Model.ProSu.Interfaces|TUpdateSubscriberMethod" />
    /// </param>
    /// <seealso cref="Model.ProSu.InterfaceActions|TInterfaceActions">
    ///   TInetrfaceActions
    /// </seealso>
    procedure UpdateSubscriber (action: TIntActions); overload;
    procedure UpdateSubscriber (notificationClass: INotification); overload;
    /// <summary>
    ///   Use this method to assign a method to the subscriber.
    /// </summary>
    procedure SetUpdateSubscriberMethod (newMethod: TUpdateSubscriberMethod); overload;
    procedure SetUpdateSubscriberMethod (newNotificationClass: TUpdateSubscriberInterfaceMethod); overload;
  end;

  /// <summary>
  ///   This interface is used by the provider
  /// </summary>
  IProvider = interface
    ['{DD326AE1-5049-43AA-9215-DF53DB5FC958}']
    /// <summary>
    ///   This method is called by the subscriber in order to subscribe to the
    ///   Provider
    /// </summary>
    /// <param name="tmpSubscriber">
    ///   The subscriber
    /// </param>
    /// <seealso cref="Model.ProSu.Interfaces|ISubscriber">
    ///   ISubscriber
    /// </seealso>
    procedure Subscribe(tmpSubscriber: ISubscriber);
    /// <summary>
    ///   This method is called from a subscriber to unsubscribe from a
    ///   provider
    /// </summary>
    /// <param name="tmpSubscriber">
    ///   The subscriber
    /// </param>
    /// <seealso cref="Model.ProSu.Interfaces|ISubscriber">
    ///   ISubscriber
    /// </seealso>
    procedure Unsubscribe(tmpSubscriber: ISubscriber);
    /// <summary>
    ///   This method is called from the Provider to communicate with the
    ///   subscribers
    /// </summary>
    /// <param name="action">
    ///   The action the provider is sending to the subscriber. The default is <b>
    ///   Default</b><br />
    /// </param>
    /// <seealso cref="TInterfaceActions">
    ///   <see cref="Model.ProSu.InterfaceActions|TInterfaceActions" />
    /// </seealso>
    procedure NotifySubscribers (action: TIntActions); overload;
    procedure NotifySubscribers (notificationClass: INotification); overload;
  end;



implementation

end.
